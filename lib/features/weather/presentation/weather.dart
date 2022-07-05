import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:test_project/features/weather/presentation/bloc/weather_bloc.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherBloc weatherBloc;
  const WeatherWidget({
    required this.weatherBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: weatherBloc,
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.status == FormzStatus.submissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            }
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: Text(
                state.weatherData.current == null
                    ? 'Press the icon to get your location'
                    : 'Weather for ${'${state.weatherData.location!.country} ${state.weatherData.location!.region} ${state.weatherData.location!.name}'}: ${state.weatherData.current!.tempC}C (${state.weatherData.current!.tempF})F',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
}
