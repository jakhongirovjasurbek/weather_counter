import 'package:test_project/core/error/failures.dart';
import 'package:test_project/core/usecases/usecase.dart';
import 'package:test_project/core/utils/either.dart';
import 'package:test_project/features/weather/data/models/weather.dart';
import 'package:test_project/features/weather/domain/repositories/weather.dart';

class GetWeatherUseCase implements UseCase<WeatherModel, String> {
  final WeatherRepository _repository;

  const GetWeatherUseCase({required WeatherRepository repository})
      : _repository = repository;

  @override
  Future<Either<ServerFailure, WeatherModel>> call(params) async {
    return await _repository.getWeather(locationName: params);
  }
}
