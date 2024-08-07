
import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: CircleAvatar(
          backgroundColor: checkCurrentTheme(
                      MediaQuery.of(context).platformBrightness) ==
                  AppThemeMode.light
              ? ColorConst.grey
              : ColorConst.darkGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              IconsConst.chevronBack,
              colorFilter: ColorFilter.mode(
                checkCurrentTheme(
                            MediaQuery.of(context).platformBrightness) ==
                        AppThemeMode.light
                    ? ColorConst.black
                    : ColorConst.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ));
  }
}
