import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/widgets/app_back_button.dart';
import 'package:alfa/features/detail/page/detail_page.dart';
import 'package:alfa/features/home/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatigoriesPage extends StatelessWidget {
  const CatigoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CatergoryWidget(),
      ),
    );
  }
}

class CatergoryWidget extends StatelessWidget {
  const CatergoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          "Shop by Categories",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 14,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: context.watch<HomeProvider>().categoires.length,
            itemBuilder: (context, index) {
              var data = context.watch<HomeProvider>().categoires[index];
              var datatext = Theme.of(context).textTheme;
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => CatigoriesDetailPage(
                              data:
                                  context.watch<HomeProvider>().all[index],
                              index: index,
                            ))),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: double.infinity,
                  height: 64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: checkCurrentTheme(MediaQuery.of(context)
                                  .platformBrightness) ==
                              AppThemeMode.dark
                          ? ColorConst.blackcard
                          : ColorConst.grey),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      CircleAvatar(
                        radius: 40 / 2,
                        backgroundImage: AssetImage(
                          data.image,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        data.name,
                        style: datatext.headlineMedium,
                      )
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }
}
