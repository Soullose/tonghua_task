import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/mqtt/mqtt_provider.dart';
import '../../common/net/http_client.dart';
import '../../common/state/auth.dart';
import '../../common/state/user_state.dart';
import '../../common/storage/basic_storage_provider.dart';
import '../../common/storage/shared_preferences_provider.dart';
import '../../constants/api_path.dart';
import '../../model/init_data/init_data.dart';
import 'i_auth_facade.dart';

class AuthFacade implements IAuthFacade {
  AuthFacade({required this.ref, required this.httpManager});

  final Ref ref;
  final HttpManager httpManager;

  @override
  Future signInWithUsernameAndPassword(
      {required String username, required String password}) async {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    sharedPreferences.remove("cookie");

    EasyLoading.show(
        dismissOnTap: true,
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear);

    await httpManager.netFetch("${ref.watch(serveAddress)}${ApiPath.signInUrl}",
        data: {"username": username, "password": password, "rememberMe": false},
        method: DioMethod.post);
  }

  @override
  Future signOut() async {
    final mqttProviderNotifier = ref.watch(mqttProvider.notifier);
    final cookie = ref.read(cookieProvider.notifier);
    cookie.state = [];
    mqttProviderNotifier.disconnect();
    final auth = ref.read(authNotifierProvider.notifier);
    auth.logout();
  }

  @override
  Future initData({required String username, required String password}) async {
    final auth = ref.read(authNotifierProvider.notifier);
    final userState = ref.read(userStateProvider.notifier);
    dynamic response = await httpManager.netFetch(
        "${ref.watch(serveAddress)}${ApiPath.initUrl}",
        method: DioMethod.get);
    if (response.code == 200) {
      final initData = initDataFromJson(jsonEncode(response.data));
      final initUser = initData.user!;
      userState.setInitUser(initUser);
      auth.login(username, password);
      EasyLoading.dismiss();
    }
  }

  @override
  Future clientMqtt() async {
    final mqttProviderNotifier = ref.watch(mqttProvider.notifier);
    mqttProviderNotifier.connect();
  }
}
