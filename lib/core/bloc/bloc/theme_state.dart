part of 'theme_bloc.dart';

class ThemeState with EquatableMixin{
  final bool isThemeLight;

  ThemeState({
    required this.isThemeLight,
  });

  ThemeState copyWith({
    bool? isThemeLight,
  }) => ThemeState(
      isThemeLight: isThemeLight ?? this.isThemeLight,
    );
  
  @override
  List<Object?> get props => [isThemeLight];
}
