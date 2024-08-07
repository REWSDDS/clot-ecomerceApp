import 'package:flutter/material.dart';

// ! Ozimizni type int string shunga oxshagan
enum AppThemeMode { light, dark }

AppThemeMode checkCurrentTheme(Brightness mode) {
  if (mode == Brightness.dark) {
    return AppThemeMode.dark;
  } else {
    return AppThemeMode.light;
  }
}

Color checkModeAndGiveColor(
    {required Brightness mode,
    required Color lightColor,
    required Color darkColor}) {
  if (mode == Brightness.dark) {
    return darkColor;
  } else {
    return lightColor;
  }
}
