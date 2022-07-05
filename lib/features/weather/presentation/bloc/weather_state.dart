// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final FormzStatus status;
  final WeatherModel weatherData;

  const WeatherState({
    required this.status,
    required this.weatherData,
  });

  WeatherState copyWith({
    FormzStatus? status,
    WeatherModel? weatherData,
  }) =>
      WeatherState(
        status: status ?? this.status,
        weatherData: weatherData ?? this.weatherData,
      );

  @override
  List<Object> get props => [status, weatherData];
}
