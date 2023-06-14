import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../storage/shared_preferences_provider.dart';

class CookieInterceptors extends QueuedInterceptorsWrapper {
  CookieInterceptors({required this.ref});

  final Ref ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final cookie = getCookie();
    if (cookie != null) {
      options.headers['Cookie'] = cookie;
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    final cookie = getCookie();
    if (cookie == null) {
      saveCookie(response);
    }
    super.onResponse(response, handler);
  }

  void saveCookie(Response<dynamic> response) async {
    final setCookie = response.headers.map['set-cookie']!;
    if (kDebugMode) {
      print('cookie:$setCookie');
    }
    final preferences = ref.watch(sharedPreferencesProvider);

    preferences.setStringList('cookie', setCookie);
  }

  List<String>? getCookie() {
    final preferences = ref.watch(sharedPreferencesProvider);
    return preferences.getStringList('cookie');
  }
}
