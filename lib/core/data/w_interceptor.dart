import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:test_project/assets/constants/app_constants.dart';
import 'package:test_project/core/data/retry_request.dart';

class WInterceptor implements Interceptor {
  @override
  void onError(DioError error, ErrorInterceptorHandler handler) async {
    try {
      if (_shouldRetryRequest(error)) {
        await DioConnectionRequestRetrier(
          connectivity: Connectivity(),
          requestOptions: error.requestOptions,
        ).retryRequest();
      }

      /// Implement your own exception handling or throw your own custom exception
      /// throws [Exception] or anything that can be thrown as an error
    } catch (e) {
      handler.next(error);
    } finally {
      handler.next(error);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Request is being handled');

 
    print(options.uri);
    print(options.headers);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    /// Implement your own exception handling
    /// Or throw your own custom exception

    handler.next(response);
  }

  bool _shouldRetryRequest(DioError error) {
    if (error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.sendTimeout ||
        (error.error != null && error.error is SocketException)) {
      print('return true');
      return true;
    }
    print('return false');
    return false;
  }
}
