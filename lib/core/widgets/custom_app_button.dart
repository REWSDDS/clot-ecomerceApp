import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/font_style/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppButon extends StatelessWidget {
  // ! NAMED OPTION VA NAMED REQUIRED {}
  const CustomAppButon({
    super.key,
    required this.title,
    this.height = 50,
    this.width = double.infinity,
    this.isMaximumWidth = true,
    this.textColor = Colors.white,
    this.backGroundColor,
    required this.onTap,
  });

  final String title;
  final double height, width;
  final VoidCallback onTap;
  final bool isMaximumWidth;
  final Color? backGroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        width: isMaximumWidth ? width : null,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: isMaximumWidth ? 0.0 : 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backGroundColor ?? ColorConst.kPrimary,
        ),
        child: Row(
          mainAxisSize: isMaximumWidth ? MainAxisSize.max : MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: FontStyleConst.medium.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
