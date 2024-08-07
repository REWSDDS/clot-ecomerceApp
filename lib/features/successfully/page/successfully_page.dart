import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/features/main/page/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessfullyPage extends StatelessWidget {
  const SuccessfullyPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme =
        checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
            AppThemeMode.dark;
    return Scaffold(
      backgroundColor: ColorConst.kPrimary,
      body: Column(
        children: [
          const Spacer(),
          SizedBox(
              height: 252, child: Image.asset("assets/images/succesfull.png")),
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 370,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: theme ? ColorConst.darkBg : ColorConst.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    "Order Placed\nSuccessfully",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "You will recieve an email confirmation",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: ColorConst.textGrey,
                        fontSize: 16),
                  ),
                  const Spacer(),
                  CustomAppButon(
                      title: "See Order details",
                      onTap: () {
                        Navigator.pushReplacement(context,
                            CupertinoPageRoute(builder: (_) => MainScreen()));
                      }),
                  const SizedBox(height: 59),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
