import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/features/main/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? false
        : true;
    return Scaffold(
      body: context
          .watch<MainProvider>()
          .pages[context.watch<MainProvider>().index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: context.watch<MainProvider>().index,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            context.read<MainProvider>().onBarTapChanged(value);
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconsConst.home,
                  colorFilter: ColorFilter.mode(
                    context
                        .read<MainProvider>()
                        .checkCurrentTabColor(0, isLight),
                    BlendMode.srcIn,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconsConst.notification,
                  colorFilter: ColorFilter.mode(
                    context
                        .read<MainProvider>()
                        .checkCurrentTabColor(1, isLight),
                    BlendMode.srcIn,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconsConst.saved,
                  colorFilter: ColorFilter.mode(
                    context
                        .read<MainProvider>()
                        .checkCurrentTabColor(2, isLight),
                    BlendMode.srcIn,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconsConst.profile,
                  colorFilter: ColorFilter.mode(
                    context
                        .read<MainProvider>()
                        .checkCurrentTabColor(3, isLight),
                    BlendMode.srcIn,
                  ),
                ),
                label: '')
          ]),
    );
  }
}
