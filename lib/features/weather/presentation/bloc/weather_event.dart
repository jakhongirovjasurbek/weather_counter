part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeather extends WeatherEvent {
  final VoidCallback onSucces;
  final ValueChanged<String> onFailure;

  const GetWeather({
    required this.onSucces,
    required this.onFailure,
  });
}
