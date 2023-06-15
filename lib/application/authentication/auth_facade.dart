import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonghua_task/application/authentication/i_auth_facade.dart';
import 'package:tonghua_task/common/state/auth.dart';

import '../../common/net/http_client.dart';
import '../../common/state/user_state.dart';
import '../../common/storage/basic_storage_provider.dart';
import '../../constacts/api_path.dart';
import '../../model/init_data/init_data.dart';

class AuthFacade implements IAuthFacade {
  AuthFacade({required this.ref});

  final Ref ref;

  @override
  Future signInWithUsernameAndPassword(
      {required String username, required String password}) async {
    EasyLoading.show(
        dismissOnTap: true,
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear);

    final httpManager = ref.read(netProvider.notifier);
    final userState = ref.read(userStateProvider.notifier);

    dynamic response = await httpManager.netFetch(
        "${ref.watch(serveAddress)}${ApiPath.signInUrl}",
        data: {"username": username, "password": password, "rememberMe": false},
        method: DioMethod.post);
    if (response.code == 200) {
      dynamic response = await httpManager.netFetch(
          "${ref.watch(serveAddress)}${ApiPath.initUrl}",
          method: DioMethod.get);
      if (response.code == 200) {

        print('------${response.data}');

        final initData = initDataFromJson(jsonEncode(response.data));

        print(initData);

        final initUser = initData.user!;

        print(initUser);

        userState.setInitUser(initUser);
        EasyLoading.dismiss(animation: true);
        final auth = ref.read(authNotifierProvider.notifier);
        auth.login(username, password);
      }
    }
  }

  @override
  Future signOut() async {
    final auth = ref.read(authNotifierProvider.notifier);
    auth.logout();
  }
}
