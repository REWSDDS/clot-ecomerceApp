import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/font_style/font_style.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:flutter/material.dart';

class CustomChoiceWidget extends StatelessWidget {
  const CustomChoiceWidget({
    super.key,
    required this.title,
    required this.action,
  });

  final String title;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 12),
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
                AppThemeMode.light
            ? ColorConst.grey
            : ColorConst.darkPurple,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: FontStyleConst.medium,
          ),
          action
        ],
      ),
    );
  }
}
