import 'package:test_project/core/data/dio.dart';
import 'package:test_project/core/data/singletons.dart';
import 'package:test_project/core/error/exceptions.dart';
import 'package:test_project/features/weather/data/models/weather.dart';

abstract class NetworkDataSource {
  /// Calls the https://lentabeta.xn--h28h.uz/api/v1/author/profile/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<WeatherModel> getWeather({required String locationName});
}

class NetworkDataSourceImpl extends NetworkDataSource {
  @override
  Future<WeatherModel> getWeather({required String locationName}) =>
      _getWeather(locationName: locationName);



  /// Implementations of methods
  Future<WeatherModel> _getWeather({required String locationName}) async {
    final dio = singletons<DioSettings>().dio;

    try {
      final response = await dio.get('/current.json', queryParameters: {
        'q': locationName,
      });
      if (response.statusCode! == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusMessage: '${response.statusMessage}',
          statusCode: response.statusCode!,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        statusMessage: '$e',
        statusCode: 141,
      );
    }
  }
}
