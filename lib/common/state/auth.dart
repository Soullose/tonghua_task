import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tonghua_task/common/utils/log_utils.dart';
import 'package:tonghua_task/constacts/api_path.dart';

import '../../model/init_data/init_data.dart';
import '../../model/user.dart';
import '../net/http_client.dart';
import '../storage/basic_storage_provider.dart';
import '../storage/shared_preferences_provider.dart';

part 'auth.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late SharedPreferences sharedPreferences;
  static const _sharedPrefsKey = 'token';
  static const _sharedPrefsCookieKey = 'cookie';

  @override
  FutureOr<User> build() async {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
    // httpManager = ref.read(netProvider.notifier);

    _persistenceRefreshLogic();

    return await _loginRecoveryAttempt();
  }

  /// Tries to perform a login with the saved token on the persistant storage.
  /// If _anything_ goes wrong, deletes the internal token and returns a [User.signedOut].
  Future<User> _loginRecoveryAttempt() async {
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
      return const User.signedOut();
    }
  }

  /// Mock of a request performed on logout (might be common, or not, whatevs).
  Future<void> logout() async {
    await Future.delayed(networkRoundTripTime);
    state = const AsyncValue.data(User.signedOut());
  }

  /// Mock of a successful login attempt, which results come from the network.
  Future<void> login(String username, String password) async {
    final httpManager = ref.read(netProvider.notifier);
    sharedPreferences.remove(_sharedPrefsCookieKey);
    state = await AsyncValue.guard<User>(() async {
      EasyLoading.show(
          dismissOnTap: true,
          indicator: const CircularProgressIndicator(),
          maskType: EasyLoadingMaskType.clear);
      return Future.delayed(
        networkRoundTripTime,
        () async {
          dynamic response = await httpManager.netFetch(
              "${ref.watch(serveAddress)}${ApiPath.signInUrl}",
              data: {
                "username": username,
                "password": password,
                "rememberMe": false
              },
              method: DioMethod.post);
          if (response.code == 200) {
            dynamic response = await httpManager.netFetch(
                "${ref.watch(serveAddress)}${ApiPath.initUrl}",
                method: DioMethod.get);
            if (response.code == 200) {
              LogUtils.i('${response.data}');
              LogUtils.i(initDataFromJson(jsonEncode(response.data)));
              final initData = initDataFromJson(jsonEncode(response.data));
              final initUser = initData.initUser;
              EasyLoading.dismiss();
              return User.signedIn(
                  id: initUser?.id,
                  token: '',
                  firstName: initUser?.firstName,
                  lastName: initUser?.lastName,
                  phoneNumber: initUser?.phoneNumber,
                  email: initUser?.email);
            }
          }
          return const User(id: '', token: '');
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

    if (logInAttempt) return const User(id: '', token: '');

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

      val.map<void>(
        (user) {
          LogUtils.i(user);
        },
        signedIn: (signedIn) =>
            sharedPreferences.setString(_sharedPrefsKey, signedIn.token),
        signedOut: (signedOut) => sharedPreferences.remove(_sharedPrefsKey),
      );
    });
  }
}

/// Simple mock of a 401 exception
class UnauthorizedException implements Exception {
  final String message;

  const UnauthorizedException(this.message);
}

/// Mock of the duration of a network request
const networkRoundTripTime = Duration(milliseconds: 200);
