import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/features/card/page/card_screen.dart';
import 'package:alfa/features/home/page/home_screen.dart';
import 'package:alfa/features/notification/page/notification_screen.dart';
import 'package:alfa/features/settings/page/settings_screen.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  // * Hozirgi tab index
  int index = 0;

  // * Screens
  List<Widget> pages = [
    const HomeScreen(),
    const NotificationScreen(),
    const CardScreen(),
    const SettingsScreen(),
  ];

  void onBarTapChanged(int i) {
    index = i;
    notifyListeners();
    // * setState
  }

  Color checkCurrentTabColor(int i, bool isLight) {
    if (i == index) {
      return ColorConst.kPrimary;
    } else {
      if (isLight) {
        return ColorConst.darkGrey;
      }
      return ColorConst.grey;
    }
  }
}
