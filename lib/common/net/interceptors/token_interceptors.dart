import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tonghua_task/common/storage/shared_preferences_provider.dart';

class TokenInterceptors extends QueuedInterceptorsWrapper {
  // String? _token;

  TokenInterceptors({required this.ref});

  final Ref ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authorizationCode = getToken();
    print('-------${authorizationCode}');
    // final authorizationCode = UserStore.to.token;
    if (authorizationCode != null) {
      options.headers['authorization'] = authorizationCode;
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    final authorizationCode = getToken();
    if (authorizationCode == null) {
      saveAuthorization(response);
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      if (kDebugMode) {
        print('the token has expired, need to receive new token');
      }
      final options = err.response!.requestOptions;
    }
    super.onError(err, handler);
  }

  void saveAuthorization(Response<dynamic> response) async {
    final String authorization = response.headers.value('authorization')!;
    if (kDebugMode) {
      print('token:$authorization');
    }
    // UserStore.to
    //     .setAuthorization(response.headers.value('authorization') ?? '');
    final preferences = ref.watch(sharedPreferencesProvider);

    preferences.setString('token', authorization);
  }

  String? getToken() {
    final preferences = ref.watch(sharedPreferencesProvider);
    return preferences.getString('token');
  }
}
