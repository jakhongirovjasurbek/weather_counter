import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/core/data/dio.dart';
import 'package:test_project/core/data/singletons.dart';

class DioConnectionRequestRetrier extends Equatable {
  final Connectivity connectivity;
  final RequestOptions requestOptions;
  const DioConnectionRequestRetrier({
    required this.connectivity,
    required this.requestOptions,
  });

  Future<void> retryRequest() async {
    late StreamSubscription subscription;
    subscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        print('Retry request');
        subscription.cancel();
        await singletons<DioSettings>().dio.request(
              requestOptions.path,
              cancelToken: requestOptions.cancelToken,
              data: requestOptions.data,
              onReceiveProgress: requestOptions.onReceiveProgress,
              onSendProgress: requestOptions.onSendProgress,
              options: Options(
                contentType: requestOptions.contentType,
                extra: requestOptions.extra,
                followRedirects: requestOptions.followRedirects,
                headers: requestOptions.headers,
                listFormat: requestOptions.listFormat,
                maxRedirects: requestOptions.maxRedirects,
                method: requestOptions.method,
                receiveDataWhenStatusError:
                    requestOptions.receiveDataWhenStatusError,
                receiveTimeout: requestOptions.receiveTimeout,
                requestEncoder: requestOptions.requestEncoder,
                responseDecoder: requestOptions.responseDecoder,
                responseType: requestOptions.responseType,
                sendTimeout: requestOptions.sendTimeout,
                validateStatus: requestOptions.validateStatus,
              ),
              queryParameters: requestOptions.queryParameters,
            );
      }
    });
  }

  @override
  List<Object?> get props => [];
}
