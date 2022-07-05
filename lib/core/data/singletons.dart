import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project/core/data/dio.dart';
import 'package:test_project/core/data/w_interceptor.dart';
import 'package:test_project/features/weather/data/data_sources/network_data_source.dart';
import 'package:test_project/features/weather/data/repositories/weather.dart';
import 'package:test_project/features/weather/domain/usecases/get_weather.dart';

final singletons = GetIt.instance;
void initializeSingletons() {
  singletons.registerLazySingleton(() => DioSettings(
        dio: Dio(BaseOptions(
          baseUrl: 'https://api.weatherapi.com/v1',
          connectTimeout: 35000,
          receiveTimeout: 33000,
          followRedirects: false,
          validateStatus: (status) => status != null && status <= 500,
        ))
          ..interceptors.add(WInterceptor()),
      ));

  /// Weather Usecase and repos
  singletons.registerLazySingleton(() => GetWeatherUseCase(
        repository: WeatherRepositoryImpl(NetworkDataSourceImpl()),
      ));
}
