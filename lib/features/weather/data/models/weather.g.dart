// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      location: json['location'] == null
          ? null
          : WeatherLocationModel.fromJson(
              json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : WeatherCurrentModel.fromJson(
              json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };

WeatherLocationModel _$WeatherLocationModelFromJson(
        Map<String, dynamic> json) =>
    WeatherLocationModel(
      name: json['name'] as String? ?? '',
      region: json['region'] as String? ?? '',
      country: json['country'] as String? ?? '',
    );

Map<String, dynamic> _$WeatherLocationModelToJson(
        WeatherLocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
    };

WeatherCurrentModel _$WeatherCurrentModelFromJson(Map<String, dynamic> json) =>
    WeatherCurrentModel(
      tempC: (json['temp_c'] as num?)?.toDouble() ?? 0.0,
      tempF: (json['temp_f'] as num?)?.toDouble() ?? 0.0,
      country: json['last_updated'] as String? ?? '',
    );

Map<String, dynamic> _$WeatherCurrentModelToJson(
        WeatherCurrentModel instance) =>
    <String, dynamic>{
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'last_updated': instance.country,
    };
