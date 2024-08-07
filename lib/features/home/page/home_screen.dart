import 'package:animate_do/animate_do.dart';
import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/widgets/card_widget.dart';
import 'package:alfa/core/widgets/custom_app_bar.dart';
import 'package:alfa/core/widgets/custom_drop_down_widget.dart';
import 'package:alfa/core/widgets/custom_text_field.dart';
import 'package:alfa/features/catigories/page/catigories_page.dart';
import 'package:alfa/features/detail/page/detail_page.dart';
import 'package:alfa/features/home/provider/home_provider.dart';
import 'package:alfa/features/home/widgets/see_all_widget.dart';
import 'package:alfa/features/search/page/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().addToTopSelling();
    context.read<HomeProvider>().generateAllInfoInOneList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        action: [
          CircleAvatar(
            backgroundColor: ColorConst.kPrimary,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(IconsConst.bag),
            ),
          )
        ],
        leadingWidth: 60,
        isTitleText: false,
        center: CustomDropDownWidget(
          menuWidth: 100,
          widthInfinity: false,
          itemValues: ['Men', 'Women', 'Kid'],
          defaultValue: 'Men',
          onChanged: (value) {},
        ),
        leading: CircleAvatar(
          radius: 40,
          backgroundImage:
              NetworkImage(context.watch<HomeProvider>().avatarImage),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 24),
                CustomTextField(
                  readOnly: true,
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SearchScreen(),
                      )),
                  hintText: 'Search ',
                  controller: _searchController,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  borderRadius: 24,
                  prefixIcon: SvgPicture.asset(
                    IconsConst.search,
                    height: 16,
                    width: 16,
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(
                        checkModeAndGiveColor(
                            mode: MediaQuery.of(context).platformBrightness,
                            lightColor: ColorConst.black,
                            darkColor: ColorConst.white),
                        BlendMode.srcIn),
                  ),
                ),
                SeeAllWidget(
                  title: 'Categories',
                  onSeeAllPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const CatigoriesPage())),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          context.watch<HomeProvider>().categoires.length,
                      itemBuilder: (context, index) {
                        final category =
                            context.watch<HomeProvider>().categoires[index];
                        return FadeIn(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => CatigoriesDetailPage(
                                            data: context
                                                .watch<HomeProvider>()
                                                .all[index],
                                            index: index)));
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 56 / 2,
                                    backgroundImage: AssetImage(category.image),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    category.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SeeAllWidget(
                  title: 'Top selling',
                  onSeeAllPressed: () {},
                ),
                SizedBox(
                  height: 282,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: context.watch<HomeProvider>().topSelling.length,
                    itemBuilder: (context, index) {
                      final model =
                          context.watch<HomeProvider>().topSelling[index];
                      return CardWidget(model: model);
                    },
                  ),
                ),
                SeeAllWidget(
                  title: 'New in',
                  titleColor: ColorConst.kPrimary,
                  onSeeAllPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
