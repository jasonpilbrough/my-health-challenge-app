import 'package:flutter/material.dart';
import 'package:my_health/app/resources/theme/theme_colours.dart';
import 'package:my_health/app/resources/theme/theme_text.dart';

class LightTheme {
  static ThemeData defaultTheme = ThemeData(
    fontFamily: ThemeText.fontFamily,
    colorScheme: ThemeColors.lightColorScheme,
    disabledColor: ThemeColors.lightColorScheme.onBackground.withOpacity(0.6),
    textTheme: ThemeText.defaultTextTheme.apply(
      bodyColor: ThemeColors.lightColorScheme.onBackground,
      displayColor: ThemeColors.lightColorScheme.onBackground,
    ),
  );
}
