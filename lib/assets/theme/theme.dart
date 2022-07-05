import 'package:flutter/material.dart';
import 'package:test_project/assets/constants/colors.dart';

abstract class AppTheme {
  /// More info for color schema: https://api.flutter.dev/flutter/material/ColorScheme-class.html
  /// More info for theme: https://docs.flutter.dev/cookbook/design/themes

  static ThemeData lightTheme() => ThemeData(
        scaffoldBackgroundColor: background,
        fontFamily: 'SF Text Pro',
        backgroundColor: background,
        appBarTheme: const AppBarTheme(color: lightThemeAppBarColor),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        textTheme: const TextTheme(
          headline1: headline1Light,
          headline2: headline2Light,
          headline3: headline3Light,
          headline4: headline4Light,
          headline5: headline5Light,
          headline6: headline6Light,
          bodyText1: bodyText1Light,
          bodyText2: bodyText2Light,
          subtitle1: subTitle1Light,
          subtitle2: subTitle2Light,
        ),
        colorScheme: const ColorScheme(
          background: background,
          brightness: Brightness.light,
          primary: lightThemeButtonColor ,
          secondary: white,
          error: errorColor,
          surface: grey,
          onPrimary: white,
          onSecondary: dark,
          onBackground: background,
          onError: white,
          onSurface: white,
        ),
      );

  static ThemeData darkTheme() => ThemeData(
        scaffoldBackgroundColor: darkThemeBackgroundColor,
        fontFamily: 'SF Text Pro',
        backgroundColor: dark,
        appBarTheme: const AppBarTheme(color: darkThemAppBarColor),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        textTheme: const TextTheme(
          headline1: headline1Dark,
          headline2: headline2Dark,
          headline3: headline3Dark,
          headline4: headline4Dark,
          headline5: headline5Dark,
          headline6: headline6Dark,
          bodyText1: bodyText1Dark,
          bodyText2: bodyText2Dark,
          subtitle1: subTitle1Dark,
          subtitle2: subTitle2Dark,
        ),
        colorScheme: const ColorScheme(
          background: background,
          brightness: Brightness.light,
          primary: darkThemeButtonColor,
          secondary: black,
          error: errorColor,
          surface: grey,
          onPrimary: white,
          onSecondary: dark,
          onBackground: background,
          onError: white,
          onSurface: white,
        ),
      );

  // Fonts
  static const headline1Light = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: dark,
  );
  static const headline2Light = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: white,
  );
  static const headline3Light = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: primary,
  );
  static const headline4Light = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: lightBlue,
  );
  static const headline5Light = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: deepGrey,
  );
  static const headline6Light = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: lightRed,
  );
  static const bodyText1Light = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: grey,
  );

  static const bodyText2Light = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: lightGrey,
  );

  static const subTitle1Light = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: blue,
  );

  static const subTitle2Light = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: green,
  );

  static const caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: red,
  );

  static const headline1Dark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: white,
  );
  static const headline2Dark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: white,
  );
  static const headline3Dark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: primary,
  );
  static const headline4Dark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: lightBlue,
  );
  static const headline5Dark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: deepGrey,
  );
  static const headline6Dark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: lightRed,
  );
  static const bodyText1Dark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: darkThemeBodyText1Color,
  );

  static const bodyText2Dark = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: lightGrey,
  );

  static const subTitle1Dark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: blue,
  );

  static const subTitle2Dark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: green,
  );

}
