import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'interceptors/error_interceptors.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/response_interceptors.dart';
import 'interceptors/token_interceptors.dart';
import 'result_data.dart';

// class HttpManager {
//   static const contentTypeJson = "application/json";
//   static const contentTypeForm = "application/x-www-form-urlencoded";
//
//   final dio = Dio();
//
//   HttpManager({required Ref ref}) {
//     dio.interceptors.add(HeaderInterceptors());
//     dio.interceptors.add(TokenInterceptors(ref: ref));
//     dio.interceptors.add(ErrorInterceptors());
//     dio.interceptors.add(ResponseInterceptors());
//   }
//
//   Future<ResultData?> netFetch(
//     url, {
//     DioMethod method = DioMethod.get,
//     Map<String, dynamic>? params,
//     Object? data,
//     Options? options,
//     Map<String, dynamic>? header,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//     noTip = false,
//   }) async {
//     const methodValues = {
//       DioMethod.get: 'get',
//       DioMethod.post: 'post',
//       DioMethod.put: 'put',
//       DioMethod.delete: 'delete',
//       DioMethod.patch: 'patch',
//       DioMethod.head: 'head'
//     };
//     options ??= Options(method: methodValues[method]);
//     // print(options.headers);
//
//     resultError(DioError e) {
//       Response? errorResponse;
//       if (e.response != null) {
//         errorResponse = e.response;
//       } else {
//         errorResponse = Response(
//             statusCode: 999, requestOptions: RequestOptions(path: url));
//       }
//       if (e.type == DioErrorType.connectionTimeout ||
//           e.type == DioErrorType.receiveTimeout) {
//         errorResponse!.statusCode = -2;
//       }
//       return ResultData(e.message, false, errorResponse!.statusCode);
//     }
//
//     Response response;
//
//     try {
//       response = await dio.request(url,
//           queryParameters: params, data: data, options: options);
//     } on DioError catch (e) {
//       return resultError(e);
//     }
//     if (response.data is DioError) {
//       return resultError(response.data);
//     }
//
//     return response.data;
//   }
// }










class HttpManager extends AutoDisposeAsyncNotifier{

  @override
  FutureOr build() {
    dio.interceptors.add(HeaderInterceptors());
    dio.interceptors.add(TokenInterceptors(ref: ref));
    dio.interceptors.add(ErrorInterceptors());
    dio.interceptors.add(ResponseInterceptors());
  }

  static const contentTypeJson = "application/json";
  static const contentTypeForm = "application/x-www-form-urlencoded";

  final dio = Dio();

  // HttpManager() {
  //   dio.interceptors.add(HeaderInterceptors());
  //   dio.interceptors.add(TokenInterceptors(ref: ref));
  //   dio.interceptors.add(ErrorInterceptors());
  //   dio.interceptors.add(ResponseInterceptors());
  // }

  Future<ResultData?> netFetch(
      url, {
        DioMethod method = DioMethod.get,
        Map<String, dynamic>? params,
        Object? data,
        Options? options,
        Map<String, dynamic>? header,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        noTip = false,
      }) async {
    const methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
      DioMethod.head: 'head'
    };
    options ??= Options(method: methodValues[method]);
    // print(options.headers);

    resultError(DioError e) {
      Response? errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(
            statusCode: 999, requestOptions: RequestOptions(path: url));
      }
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        errorResponse!.statusCode = -2;
      }
      return ResultData(e.message, false, errorResponse!.statusCode);
    }

    Response response;

    try {
      response = await dio.request(url,
          queryParameters: params, data: data, options: options);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }

    return response.data;
  }
}





// final HttpManager httpManager = HttpManager();


// class Net extends AutoDisposeAsyncNotifier<HttpManager>{
//   @override
//   FutureOr<HttpManager> build() => HttpManager(ref: ref);
// }

final netProvider = AutoDisposeAsyncNotifierProvider(()=>HttpManager());

enum DioMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}