import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/icons/icons_const.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget(
      {super.key,
      required this.itemValues,
      required this.defaultValue,
      this.widthInfinity = true,
      this.menuWidth = 300,
      this.onChanged});

  final List<String> itemValues;
  final String defaultValue;
  final void Function(dynamic)? onChanged;
  final bool widthInfinity;
  final double menuWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthInfinity ? double.infinity : null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
                AppThemeMode.dark
            ? ColorConst.darkGrey
            : ColorConst.grey,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: SvgPicture.asset(
            IconsConst.arrowDown,
            colorFilter: ColorFilter.mode(
                checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
                        AppThemeMode.dark
                    ? ColorConst.white
                    : ColorConst.black,
                BlendMode.srcIn),
          ),
          items: List.generate(
            itemValues.length,
            (index) => DropdownMenuItem(
              value: itemValues[index],
              child: Text(itemValues[index]),
            ),
          ),
          onChanged: onChanged,
          menuMaxHeight: menuWidth,
          value: defaultValue,
        ),
      ),
    );
  }
}
