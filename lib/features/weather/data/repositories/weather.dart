import 'package:test_project/core/error/exceptions.dart';
import 'package:test_project/features/weather/data/data_sources/network_data_source.dart';
import 'package:test_project/features/weather/data/models/weather.dart';
import 'package:test_project/core/utils/either.dart';
import 'package:test_project/core/error/failures.dart';
import 'package:test_project/features/weather/domain/repositories/weather.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final NetworkDataSource dataSource;

  WeatherRepositoryImpl(this.dataSource);
  @override
  Future<Either<ServerFailure, WeatherModel>> getWeather(
          {required String locationName}) =>
      _getWeather(locationName: locationName);

  Future<Either<ServerFailure, WeatherModel>> _getWeather({
    required String locationName,
  }) async {
    try {
      final response = await dataSource.getWeather(locationName: locationName);
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.statusMessage, statusCode: e.statusCode),
      );
    }
  }
}
