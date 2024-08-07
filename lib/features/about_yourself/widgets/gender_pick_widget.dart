
import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/features/about_yourself/provider/about_yourself_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderPickWidget extends StatelessWidget {
  const GenderPickWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CustomAppButon(
              backGroundColor: context
                          .watch<AboutYourselfProvider>()
                          .pickedGenderMen ==
                      PickedGender.men
                  ? ColorConst.kPrimary
                  : MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? ColorConst.darkGrey
                      : ColorConst.grey,
              textColor: checkCurrentTheme(MediaQuery.of(context)
                          .platformBrightness) ==
                      AppThemeMode.dark
                  ? ColorConst.white
                  : context
                              .watch<AboutYourselfProvider>()
                              .pickedGenderMen ==
                          PickedGender.men
                      ? ColorConst.white
                      : ColorConst.black,
              title: 'Men',
              onTap: () {
                context
                    .read<AboutYourselfProvider>()
                    .setPickedGenderMen(PickedGender.men);
                context
                    .read<AboutYourselfProvider>()
                    .setPickedGenderWomen(PickedGender.none);
              }),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomAppButon(
            backGroundColor: context
                        .watch<AboutYourselfProvider>()
                        .pickedGenderWomen ==
                    PickedGender.women
                ? ColorConst.kPrimary
                : MediaQuery.of(context).platformBrightness ==
                        Brightness.dark
                    ? ColorConst.darkGrey
                    : ColorConst.grey,
            textColor: checkCurrentTheme(
                        MediaQuery.of(context).platformBrightness) ==
                    AppThemeMode.dark
                ? ColorConst.white
                : context
                            .watch<AboutYourselfProvider>()
                            .pickedGenderWomen ==
                        PickedGender.women
                    ? ColorConst.white
                    : ColorConst.black,
            title: 'Women',
            onTap: () {
              context
                  .read<AboutYourselfProvider>()
                  .setPickedGenderWomen(PickedGender.women);
              context
                  .read<AboutYourselfProvider>()
                  .setPickedGenderMen(PickedGender.none);
            },
          ),
        )
      ],
    );
  }
}
