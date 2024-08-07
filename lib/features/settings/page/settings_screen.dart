import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/utils/local_db_service.dart';
import 'package:alfa/features/address/page/address_screen.dart';
import 'package:alfa/features/like/page/like_screen.dart';
import 'package:alfa/features/payment/page/payment_screen.dart';
import 'package:alfa/features/settings/widgets/widget_conatiner.dart';
import 'package:alfa/features/sign_in/page/log_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyJTIwaW1nfGVufDB8fDB8fHww'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        color: checkCurrentTheme(MediaQuery.of(context)
                                    .platformBrightness) ==
                                AppThemeMode.light
                            ? ColorConst.grey
                            : ColorConst.darkBg,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${LocalDbService.getStorageIntance.read('firstName')} ${LocalDbService.getStorageIntance.read('lastName')}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  LocalDbService.getStorageIntance
                                      .read('email'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: checkCurrentTheme(MediaQuery
                                                          .of(context)
                                                      .platformBrightness) ==
                                                  AppThemeMode.light
                                              ? ColorConst.black
                                              : ColorConst.grey),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'age: ${LocalDbService.getStorageIntance.read('age')} | gender: ${LocalDbService.getStorageIntance.read('gender')}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: checkCurrentTheme(MediaQuery
                                                          .of(context)
                                                      .platformBrightness) ==
                                                  AppThemeMode.light
                                              ? ColorConst.black
                                              : ColorConst.grey),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Edit",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: checkCurrentTheme(
                                                  MediaQuery.of(context)
                                                      .platformBrightness) ==
                                              AppThemeMode.light
                                          ? ColorConst.kPrimary
                                          : ColorConst.kPrimary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  WidgetContainer(
                    title: "Address",
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const AddressScreen())),
                  ),
                  WidgetContainer(
                    title: "Wishlist",
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LikeScreen())),
                  ),
                  WidgetContainer(
                    title: "Payment",
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const PaymentScreen())),
                  ),
                  const WidgetContainer(
                    title: "Help",
                  ),
                  const WidgetContainer(
                    title: "Support",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                      onPressed: () {
                        LocalDbService.removeData();
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const LogInScreen()));
                      },
                      child: Text(
                        'Delete account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: checkCurrentTheme(MediaQuery.of(context)
                                          .platformBrightness) ==
                                      AppThemeMode.light
                                  ? Colors.red
                                  : Colors.red,
                            ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
