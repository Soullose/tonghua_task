import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:tonghua_task/application/authentication/i_auth_facade.dart';
import 'package:tonghua_task/common/mqtt/mqtt_connection_status_provider.dart';
import 'package:tonghua_task/common/state/auth.dart';

import '../../common/mqtt/mqtt_provider.dart';
import '../../common/net/http_client.dart';
import '../../common/state/user_state.dart';
import '../../common/storage/basic_storage_provider.dart';
import '../../common/storage/shared_preferences_provider.dart';
import '../../constants/api_path.dart';
import '../../model/init_data/init_data.dart';

class AuthFacade implements IAuthFacade {
  AuthFacade({required this.ref});

  final Ref ref;

  @override
  Future signInWithUsernameAndPassword(
      {required String username, required String password}) async {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    sharedPreferences.remove("cookie");
    EasyLoading.show(
        dismissOnTap: true,
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear);

    final httpManager = ref.read(netProvider.notifier);
    // final userState = ref.read(userStateProvider.notifier);

    dynamic response = await httpManager.netFetch(
        "${ref.watch(serveAddress)}${ApiPath.signInUrl}",
        data: {"username": username, "password": password, "rememberMe": false},
        method: DioMethod.post);
    if (response.code == 200) {
      // dynamic response = await httpManager.netFetch(
      //     "${ref.watch(serveAddress)}${ApiPath.initUrl}",
      //     method: DioMethod.get);
      // if (response.code == 200) {
      //   print('------${response.data}');
      //
      //   final initData = initDataFromJson(jsonEncode(response.data));
      //
      //   print(initData);
      //
      //   final initUser = initData.user!;
      //
      //   print(initUser);
      //
      //   userState.setInitUser(initUser);
      // }

      initData().then((value) => EasyLoading.dismiss(animation: true));

      final auth = ref.read(authNotifierProvider.notifier);
      auth.login(username, password);
    }
  }

  @override
  Future signOut() async {
    final auth = ref.read(authNotifierProvider.notifier);
    auth.logout();
  }

  @override
  Future initData() async {
    final httpManager = ref.read(netProvider.notifier);
    final userState = ref.read(userStateProvider.notifier);
    dynamic response = await httpManager.netFetch(
        "${ref.watch(serveAddress)}${ApiPath.initUrl}",
        method: DioMethod.get);
    if (response.code == 200) {
      final initData = initDataFromJson(jsonEncode(response.data));
      final initUser = initData.user!;
      userState.setInitUser(initUser);
    }
  }

  Future clientMqtt() async {
    final mqttProviderNotifier = ref.watch(mqttProvider.notifier);
    final mqttConnectStateProvider = ref.watch(mqttClientConnectStatusProvider);
    mqttProviderNotifier.connect();
    if(mqttConnectStateProvider == MqttConnectionState.connected){

    }
    switch (mqttConnectStateProvider){
      case MqttConnectionState.connected:
        Fluttertoast.showToast(msg: '消息服务连接成功');
        break;
      case MqttConnectionState.disconnecting:
        // TODO: Handle this case.
        break;
      case MqttConnectionState.disconnected:
        // TODO: Handle this case.
        break;
      case MqttConnectionState.connecting:
        // TODO: Handle this case.
        break;
      case MqttConnectionState.faulted:
        // TODO: Handle this case.
        break;
    }
  }
}
