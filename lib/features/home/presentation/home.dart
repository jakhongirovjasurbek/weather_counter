import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:test_project/features/counter/presentation/counter.dart';
import 'package:test_project/features/home/presentation/widgets/home_screen_buttons.dart';
import 'package:test_project/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:test_project/features/weather/presentation/weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CounterBloc counterBloc;
  late WeatherBloc weatherBloc;

  @override
  void initState() {
    super.initState();
    counterBloc = CounterBloc();
    weatherBloc = WeatherBloc();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: counterBloc),
          BlocProvider.value(value: weatherBloc),
        ],
        child: SafeArea(
          minimum: EdgeInsets.fromLTRB(
              0, 0, 0, MediaQuery.of(context).padding.bottom),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Weather Counter',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WeatherWidget(weatherBloc: weatherBloc),
                    const SizedBox(height: 16),
                    CounterWidget(counterBloc: counterBloc),
                  ],
                ),
                HomeScreenButtons(counterBloc: counterBloc),
              ],
            ),
          ),
        ),
      );
}
