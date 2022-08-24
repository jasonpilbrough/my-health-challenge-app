import 'package:flutter/material.dart';

class ThemeColors {
  static const kDividerColor = Colors.grey;
  static const kInactiveColor = Colors.grey;

  static const _kPrimaryColor = Color(0xFF004B8D);
  static const _kSecondaryColor = Color(0xFFBA8C60);
  static const _kOnWhiteColor = Color(0xFF000000);

  static ColorScheme lightColorScheme = const ColorScheme.light().copyWith(
    primary: _kPrimaryColor,
    secondary: _kSecondaryColor,
    onBackground: _kOnWhiteColor,
    onSurface: _kOnWhiteColor,
  );

  static ColorScheme darkColorScheme = const ColorScheme.dark().copyWith(
    primary: _kPrimaryColor,
    secondary: _kSecondaryColor,
    onBackground: Colors.white,
    onSurface: Colors.white,
  );
}
