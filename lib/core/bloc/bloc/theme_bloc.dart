import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(isThemeLight: true),
        ) {
    on<ChangeTheme>((event, emit) {
      emit(state.copyWith(isThemeLight: !state.isThemeLight));
    });
  }
}
