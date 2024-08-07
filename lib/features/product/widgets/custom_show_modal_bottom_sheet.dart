import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/font_style/font_style.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/model/cloth_model.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/features/product/provider/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomShowModalBottomSheet extends StatelessWidget {
  const CustomShowModalBottomSheet({
    super.key,
    required this.title,
    this.colorCode = const [],
    this.colorName = const [],
    this.sizes = const [],
    required this.isColor,
  });

  final String title;
  final List<ClothSize> sizes;
  final bool isColor;
  final List<String> colorName;
  final List<int> colorCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 390,
      width: double.infinity,
      color: checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
              AppThemeMode.light
          ? ColorConst.white
          : ColorConst.darkPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 50),
                Text(title,
                    style: FontStyleConst.huge
                        .copyWith(fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.xmark),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              itemCount: isColor ? colorCode.length : sizes.length,
              itemBuilder: (context, index) {
                Color? pickedColor = (checkCurrentTheme(
                            MediaQuery.of(context).platformBrightness) ==
                        AppThemeMode.light
                    ? ColorConst.grey
                    : ColorConst.darkBg);

                if (isColor) {
                  if (colorName[index] ==
                      context.watch<ProductProvider>().colorName) {
                    pickedColor = ColorConst.kPrimary;
                  }
                } else {
                  if (sizes[index] ==
                      context.watch<ProductProvider>().clothSize) {
                    pickedColor = ColorConst.kPrimary;
                  }
                }

                return GestureDetector(
                  onTap: () {
                    if (isColor) {
                      context
                          .read<ProductProvider>()
                          .tablaRang(colorName[index], colorCode[index]);
                    } else {
                      context.read<ProductProvider>().tanlaRazmer(sizes[index]);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: pickedColor,
                    ),
                    child: ListTile(
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isColor
                                ? Visibility(
                                    visible: isColor,
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor:
                                          pickedColor == ColorConst.kPrimary
                                              ? ColorConst.white
                                              : Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor:
                                            Color(colorCode[index]),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: Visibility(
                                  visible: pickedColor == ColorConst.kPrimary,
                                  child: SvgPicture.asset(IconsConst.verify)),
                            ),
                          ],
                        ),
                      ),
                      title:
                          Text(isColor ? colorName[index] : sizes[index].name),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
