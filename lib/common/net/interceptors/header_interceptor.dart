import 'package:dio/dio.dart';

class HeaderInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    ///超时
    options.connectTimeout = const Duration(seconds: 3);
    options.receiveTimeout = const Duration(seconds: 3);

    super.onRequest(options, handler);
  }
}
