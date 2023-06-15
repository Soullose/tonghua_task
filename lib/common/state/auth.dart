import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tonghua_task/common/state/auth_state.dart';

import '../../model/init_data/init_data.dart';
import '../storage/shared_preferences_provider.dart';

part 'auth.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late SharedPreferences sharedPreferences;
  static const _sharedPrefsKey = 'token';
  static const _sharedPrefsCookieKey = 'cookie';

  @override
  FutureOr<AuthState> build() async {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
    // _persistenceRefreshLogic();

    return await _loginRecoveryAttempt();
  }

  /// Tries to perform a login with the saved token on the persistant storage.
  /// If _anything_ goes wrong, deletes the internal token and returns a [User.signedOut].
  Future<AuthState> _loginRecoveryAttempt() async {
    try {
      final savedToken = sharedPreferences.getString(_sharedPrefsKey);
      if (savedToken == null) {
        throw const UnauthorizedException(
          "Couldn't find the authentication token",
        );
      }

      return await _loginWithToken(savedToken);
    } catch (_, __) {
      await sharedPreferences.remove(_sharedPrefsKey);
      return const AuthState.signedOut();
    }
  }

  /// Mock of a request performed on logout (might be common, or not, whatevs).
  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = const AsyncValue.data(AuthState.signedOut());
  }

  /// Mock of a successful login attempt, which results come from the network.
  Future<void> login(String username, String password) async {
    sharedPreferences.remove(_sharedPrefsCookieKey);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard<AuthState>(() async {
      return Future.delayed(
        networkRoundTripTime,
        () async {
          return AuthState.signedIn(username: username, password: password);
        },
      );
    });
  }

  /// Mock of a login request performed with a saved token.
  /// If such request fails, this method will throw an [UnauthorizedException].
  Future<AuthState> _loginWithToken(String token) async {
    final logInAttempt = await Future.delayed(
      networkRoundTripTime,
      () => true,
    );

    if (logInAttempt) return const AuthState.signedOut();

    throw const UnauthorizedException('401 Unauthorized or something');
  }

  /// Internal method used to listen authentication state changes.
  /// When the auth object is in a loading state, nothing happens.
  /// When the auth object is in a error state, we choose to remove the token
  /// Otherwise, we expect the current auth value to be reflected in our persitence API
  // void _persistenceRefreshLogic() {
  //   ref.listenSelf((_, next) {
  //     if (next.isLoading) return;
  //     if (next.hasError) {
  //       sharedPreferences.remove(_sharedPrefsKey);
  //       return;
  //     }
  //
  //     final val = next.requireValue;
  //
  //     val.map<void>(
  //       signedIn: (signedIn) =>
  //           sharedPreferences.setString(_sharedPrefsKey, signedIn.token),
  //       signedOut: (signedOut) => sharedPreferences.remove(_sharedPrefsKey),
  //     );
  //   });
  // }
}

/// Simple mock of a 401 exception
class UnauthorizedException implements Exception {
  final String message;

  const UnauthorizedException(this.message);
}

/// Mock of the duration of a network request
const networkRoundTripTime = Duration(milliseconds: 200);
