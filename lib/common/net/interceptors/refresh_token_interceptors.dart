import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RefreshTokenInterceptors extends QueuedInterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      if (kDebugMode) {
        print('the token has expired, need to receive new token');
      }
      // final options = err.response!.requestOptions;
    }
    super.onError(err, handler);
  }
}
