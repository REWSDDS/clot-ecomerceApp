import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/font_style/font_style.dart';
import 'package:flutter/material.dart';

ThemeData get light => ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorConst.white,
        elevation: 0,
        selectedItemColor: ColorConst.kPrimary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: ColorConst.white,
      ),
      textTheme: TextTheme(
        headlineSmall: FontStyleConst.small,
        headlineMedium: FontStyleConst.medium,
        headlineLarge: FontStyleConst.huge,
        bodyLarge: FontStyleConst.big,
      ),
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: ColorConst.kPrimary,
      ),
    );

ThemeData get dark => ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorConst.darkPurple,
        elevation: 0,
        selectedItemColor: ColorConst.kPrimary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      appBarTheme:
          AppBarTheme(elevation: 0, backgroundColor: ColorConst.darkPurple),
      scaffoldBackgroundColor: ColorConst.darkPurple,
      textTheme: TextTheme(
        headlineSmall: FontStyleConst.small.copyWith(color: ColorConst.white),
        headlineMedium: FontStyleConst.medium.copyWith(color: ColorConst.white),
        headlineLarge: FontStyleConst.huge.copyWith(color: ColorConst.white),
        bodyLarge: FontStyleConst.big.copyWith(color: ColorConst.white),
      ),
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: ColorConst.kPrimary,
      ),
    );
