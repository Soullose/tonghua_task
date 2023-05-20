import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tonghua_task/common/net/http_client.dart';
import 'package:tonghua_task/common/storage/basic_storage_provider.dart';

import '../../model/user.dart';
import '../storage/shared_preferences_provider.dart';

class AuthNotifier extends AutoDisposeAsyncNotifier {
  late SharedPreferences sharedPreferences;
  static const _sharedPrefsKey = 'token';

  @override
  FutureOr build() async {
    sharedPreferences = ref.watch(sharedPreferencesProvider);

    _persistenceRefreshLogic();

    return await _loginRecoveryAttempt();
  }

  /// Tries to perform a login with the saved token on the persistant storage.
  /// If _anything_ goes wrong, deletes the internal token and returns a [User.signedOut].
  Future<User?> _loginRecoveryAttempt() async {
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
      return null;
    }
  }

  /// Mock of a request performed on logout (might be common, or not, whatevs).
  Future<void> logout() async {
    await Future.delayed(networkRoundTripTime);
    state = const AsyncValue.data(null);
  }

  /// Mock of a successful login attempt, which results come from the network.
  Future<void> login(String email, String password) async {
    state = await AsyncValue.guard<User>(() async {
      return Future.delayed(
        networkRoundTripTime,
            () async {
          dynamic response = await httpManager.netFetch("http://$serveAddress/");
          return const User(id: '');
        },
      );
    });
  }

  /// Mock of a login request performed with a saved token.
  /// If such request fails, this method will throw an [UnauthorizedException].
  Future<User> _loginWithToken(String token) async {
    final logInAttempt = await Future.delayed(
      networkRoundTripTime,
          () => true,
    );

    if (logInAttempt) return const User(id: '');

    throw const UnauthorizedException('401 Unauthorized or something');
  }

  /// Internal method used to listen authentication state changes.
  /// When the auth object is in a loading state, nothing happens.
  /// When the auth object is in a error state, we choose to remove the token
  /// Otherwise, we expect the current auth value to be reflected in our persitence API
  void _persistenceRefreshLogic() {
    ref.listenSelf((_, next) {
      if (next.isLoading) return;
      if (next.hasError) {
        sharedPreferences.remove(_sharedPrefsKey);
        return;
      }

      final val = next.requireValue;
      final isAuthenticated = val == null;

      isAuthenticated
          ? sharedPreferences.remove(_sharedPrefsKey)
          : sharedPreferences.setString(_sharedPrefsKey, val.token);
    });
  }
}

/// Simple mock of a 401 exception
class UnauthorizedException implements Exception {
  final String message;

  const UnauthorizedException(this.message);
}

/// Mock of the duration of a network request
const networkRoundTripTime = Duration(milliseconds: 750);
