import 'package:flutter/material.dart';

class ThemeText {
  static String fontFamily = 'Roboto';

  static TextTheme defaultTextTheme = const TextTheme(
    headline1: _headline1,
    headline2: _headline2,
    headline3: _headline3,
    headline4: _headline4,
    headline5: _headline5,
    headline6: _headline6,
    bodyText1: _bodyText1,
    bodyText2: _bodyText2,
  );

  static const _headline1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w500,
  );

  static const _headline2 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
  );

  static const _headline3 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );

  static const _headline4 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );

  static const _headline5 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static const _headline6 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static const _bodyText1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  static const _bodyText2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
}
