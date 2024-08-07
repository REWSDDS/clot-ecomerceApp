import 'package:animate_do/animate_do.dart';
import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSignInWidget extends StatelessWidget {
  const AppSignInWidget(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.title,
      required this.isRigh});

  final String icon;
  final VoidCallback onTap;
  final String title;
  final bool isRigh;

  @override
  Widget build(BuildContext context) {
    return isRigh
        ? SlideInRight(
            child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: double.infinity,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: checkCurrentTheme(
                          MediaQuery.of(context).platformBrightness) ==
                      AppThemeMode.light
                  ? ColorConst.grey
                  : ColorConst.darkBg,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: icon == IconsConst.apple
                      ? SvgPicture.asset(icon)
                      : Image.asset(
                          icon,
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      'Continue with $title',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox())
              ],
            ),
          ))
        : SlideInLeft(
            child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: double.infinity,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: checkCurrentTheme(
                          MediaQuery.of(context).platformBrightness) ==
                      AppThemeMode.light
                  ? ColorConst.grey
                  : ColorConst.darkBg,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: icon == IconsConst.apple
                      ? SvgPicture.asset(icon)
                      : Image.asset(
                          icon,
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      'Continue with $title',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox())
              ],
            ),
          ));
  }
}
