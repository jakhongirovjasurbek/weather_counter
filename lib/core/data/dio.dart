import 'package:dio/dio.dart';

class DioSettings {
  final Dio _dio;

  DioSettings({required Dio dio}) : _dio = dio;

  Dio get dio {
    return _dio;
  }
}
