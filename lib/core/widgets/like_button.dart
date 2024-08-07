import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({super.key, required this.onTap, required this.isLiked});

  final bool isLiked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: CircleAvatar(
          backgroundColor:
              checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
                      AppThemeMode.light
                  ? ColorConst.grey
                  : ColorConst.darkGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: isLiked
                ? Icon(
                    CupertinoIcons.heart_fill,
                    color: ColorConst.red,
                    size: 20,
                  )
                : SvgPicture.asset(
                    IconsConst.favourite,
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
