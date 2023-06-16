import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/log_utils.dart';
import '../result_data.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //没有网络
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(
        DioException(
            type: DioExceptionType.unknown,
            requestOptions: options,
            response: Response(
              requestOptions: options,
              statusCode: -1,
              data: ResultData("网络错误", false, -1),
            ),
            message: "网络错误未连接网络"),
      );
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    String errorDescription = "";

    if (err.type == DioExceptionType.connectionTimeout) {
      errorDescription = "连接超时";
    } else if (err.type == DioExceptionType.receiveTimeout) {
      errorDescription = "接收数据超时";
    } else if (err.type == DioExceptionType.sendTimeout) {
      errorDescription = "发送数据超时";
    } else if (err.type == DioExceptionType.badResponse) {
      if (err.response!.statusCode == HttpStatus.unauthorized) {
        errorDescription = "登录过期，请重新登录";
      } else if (err.response!.statusCode == HttpStatus.internalServerError) {
        errorDescription = "服务器内部错误";
      } else {
        errorDescription = "网络请求出错";
      }
    } else if (err.type == DioExceptionType.cancel) {
      errorDescription = "请求已取消";
    } else {
      errorDescription = "网络请求出错";
    }
    LogUtils.e(errorDescription);
    Fluttertoast.showToast(
        msg: errorDescription,
        fontSize: 16.sp,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        gravity: ToastGravity.CENTER);
    super.onError(err, handler);
  }
}
