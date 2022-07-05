import 'package:test_project/core/error/failures.dart';
import 'package:test_project/core/utils/either.dart';
import 'package:test_project/features/weather/data/models/weather.dart';

abstract class WeatherRepository {
  Future<Either<ServerFailure, WeatherModel>> getWeather({
    required String locationName,
  });
}
