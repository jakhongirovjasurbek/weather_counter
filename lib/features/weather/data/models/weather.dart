// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherModel {
  @JsonKey(name: 'location')
  final WeatherLocationModel? location;
  @JsonKey(name: 'current')
  final WeatherCurrentModel? current;

  const WeatherModel({
    required this.location,
    required this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@JsonSerializable()
class WeatherLocationModel {
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'region', defaultValue: '')
  final String region;
  @JsonKey(name: 'country', defaultValue: '')
  final String country;

  const WeatherLocationModel({
    required this.name,
    required this.region,
    required this.country,
  });

  factory WeatherLocationModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationModelFromJson(json);
}

@JsonSerializable()
class WeatherCurrentModel {
  @JsonKey(name: 'temp_c', defaultValue: 0.0)
  final double tempC;
  @JsonKey(name: 'temp_f', defaultValue: 0.0)
  final double tempF;
  @JsonKey(name: 'last_updated', defaultValue: '')
  final String country;

  const WeatherCurrentModel({
    required this.tempC,
    required this.tempF,
    required this.country,
  });

  factory WeatherCurrentModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherCurrentModelFromJson(json);
}
