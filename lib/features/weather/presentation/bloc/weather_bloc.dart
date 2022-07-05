import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:formz/formz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_project/core/data/singletons.dart';
import 'package:test_project/features/weather/data/models/weather.dart';
import 'package:test_project/features/weather/domain/usecases/get_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase _getWeatherUseCase = singletons<GetWeatherUseCase>();
  WeatherBloc()
      : super(WeatherState(
            status: FormzStatus.pure, weatherData: WeatherModel.fromJson({}))) {
    on<GetWeather>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        if (await Permission.location.isDenied) {
          await Permission.location.request();
        }

        if (await Permission.location.isGranted) {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          print(position);
          final coordinated =
              Coordinates(position.latitude, position.longitude);
          final name =
              await Geocoder.local.findAddressesFromCoordinates(coordinated);
          if (name.isNotEmpty) {
            final response = await _getWeatherUseCase
                .call(name.first.addressLine ?? name.first.countryName ?? '');

            emit(state.copyWith(status: FormzStatus.submissionInProgress));
            response.either((failure) {
              emit(state.copyWith(status: FormzStatus.submissionFailure));
              event.onFailure(failure.errorMessage);
            }, (data) {
              emit(state.copyWith(
                status: FormzStatus.submissionSuccess,
                weatherData: data,
              ));
              event.onSucces();
            });
          } else {
            emit(state.copyWith(status: FormzStatus.submissionFailure));
            event.onFailure(
                'Error occured while sending the current position information. Pleasem try again.');
          }
        } else {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
            event.onFailure(
                'Permission for location access is not allowed in this device. Please, allow to access current location.');
        }
      } catch (e) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
        event.onFailure('$e');
      }
    });
  }
}
