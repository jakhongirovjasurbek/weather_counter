import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/assets/theme/theme.dart';
import 'package:test_project/core/bloc/bloc/theme_bloc.dart';
import 'package:test_project/core/data/singletons.dart';
import 'package:test_project/features/home/presentation/home.dart';

void main() {
  initializeSingletons();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Test Project',
              theme: state.isThemeLight
                  ? AppTheme.lightTheme()
                  : AppTheme.darkTheme(),
              home: const HomeScreen(),
            );
          },
        ),
      );
}
