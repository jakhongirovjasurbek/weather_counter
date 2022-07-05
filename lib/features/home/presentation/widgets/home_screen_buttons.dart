import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/assets/constants/icons.dart';
import 'package:test_project/core/bloc/bloc/theme_bloc.dart';
import 'package:test_project/core/global_widgets/w_button.dart';
import 'package:test_project/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:test_project/features/weather/presentation/bloc/weather_bloc.dart';

class HomeScreenButtons extends StatelessWidget {
  const HomeScreenButtons({
    required this.counterBloc,
    Key? key,
  }) : super(key: key);

  final CounterBloc counterBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            WButton(
              width: 50,
              height: 50,
              borderRadius: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Theme.of(context).colorScheme.primary,
              onTap: () {
                context.read<WeatherBloc>().add(GetWeather(
                      onSucces: () {},
                      onFailure: (message) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Theme.of(context).colorScheme.error,
                          content: Text(
                            message,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.onError,
                                ),
                          ),
                        ));
                      },
                    ));
              },
              child: SvgPicture.asset(
                AppIcons.cloud,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const Spacer(),
            WButton(
              width: 50,
              height: 50,
              borderRadius: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Theme.of(context).colorScheme.primary,
              onTap: () {
                counterBloc.add(IncrementDecrementCounter(
                  isIncrementRequested: true,
                  isIncrementDecrementValueTwo:
                      !context.read<ThemeBloc>().state.isThemeLight,
                  onFailure: (message) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      content: Text(
                        message,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onError,
                            ),
                      ),
                    ));
                  },
                ));
              },
              child: SvgPicture.asset(
                AppIcons.plus,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        Row(
          children: [
            WButton(
              width: 50,
              height: 50,
              borderRadius: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Theme.of(context).colorScheme.primary,
              child: Icon(
                Icons.color_lens,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onTap: () async {
                context.read<ThemeBloc>().add(const ChangeTheme());
              },
            ),
            const Spacer(),
            WButton(
              width: 50,
              height: 50,
              borderRadius: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Theme.of(context).colorScheme.primary,
              onTap: () {
                counterBloc.add(IncrementDecrementCounter(
                  isIncrementRequested: false,
                  isIncrementDecrementValueTwo:
                      !context.read<ThemeBloc>().state.isThemeLight,
                  onFailure: (message) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      content: Text(
                        message,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onError,
                            ),
                      ),
                    ));
                  },
                ));
              },
              child: SvgPicture.asset(
                AppIcons.minus,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
