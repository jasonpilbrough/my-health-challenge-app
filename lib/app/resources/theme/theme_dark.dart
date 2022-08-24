import 'package:flutter/material.dart';
import 'package:my_health/app/resources/theme/theme_colours.dart';
import 'package:my_health/app/resources/theme/theme_text.dart';

class DarkTheme {
  static ThemeData defaultTheme = ThemeData(
    fontFamily: ThemeText.fontFamily,
    colorScheme: ThemeColors.darkColorScheme,
    disabledColor: ThemeColors.darkColorScheme.onBackground.withOpacity(0.7),
    textTheme: ThemeText.defaultTextTheme.apply(
      bodyColor: ThemeColors.darkColorScheme.onBackground,
      displayColor: ThemeColors.darkColorScheme.onBackground,
    ),
  );
}
