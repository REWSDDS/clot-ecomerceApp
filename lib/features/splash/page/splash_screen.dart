import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/utils/local_db_service.dart';
import 'package:alfa/features/main/page/main_screen.dart';
import 'package:alfa/features/sign_in/page/log_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 5)).then((v) {
    //   print('after 5 seconds');
    // });
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  LocalDbService.getStorageIntance.read('email') == null
                      ? const LogInScreen()
                      : const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
                  AppThemeMode.dark
              ? ColorConst.darkPurple
              : ColorConst.kPrimary,
      body: Center(
        child: FadeIn(
            delay: const Duration(milliseconds: 1500),
            child: Image.asset(IconsConst.logo)),
      ),
    );
  }
}
