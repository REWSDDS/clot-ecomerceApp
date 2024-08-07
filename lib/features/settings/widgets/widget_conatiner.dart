import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WidgetContainer extends StatelessWidget {
  const WidgetContainer({
    super.key,
    required this.title,
     this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
            color: checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
                    AppThemeMode.light
                ? ColorConst.grey
                : ColorConst.darkBg,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: checkCurrentTheme(
                                MediaQuery.of(context).platformBrightness) ==
                            AppThemeMode.light
                        ? ColorConst.black
                        : ColorConst.grey),
              ),
              SvgPicture.asset(
                IconsConst.chevronRight,
                width: 24.0,
                height: 24.0,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                    checkCurrentTheme(
                                MediaQuery.of(context).platformBrightness) ==
                            AppThemeMode.light
                        ? ColorConst.black
                        : ColorConst.white,
                    BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
