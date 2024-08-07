import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/font_style/font_style.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/widgets/app_back_button.dart';
import 'package:alfa/core/widgets/card_widget.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/core/widgets/custom_text_field.dart';
import 'package:alfa/features/catigories/page/catigories_page.dart';
import 'package:alfa/features/home/provider/home_provider.dart';
import 'package:alfa/features/search/provider/search_provider.dart';
import 'package:alfa/features/search/widgets/custom_filter_model_bottom_sheet.dart';
import 'package:alfa/features/search/widgets/deals_filter_widget.dart';
import 'package:alfa/features/search/widgets/gender_filter_widget.dart';
import 'package:alfa/features/search/widgets/my_price_filter_widget.dart';
import 'package:alfa/features/search/widgets/sort_by_filter_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Widget> _buildSelectedFilters(SearchProvider provider) {
    List<Widget> filters = [];
    filters
        .add(_buildFilterChip(isIcon: true, icon: IconsConst.filter, '', ''));
    if (provider.filterPrice) filters.add(_buildFilterChip('Price', 'Price'));
    if (provider.filterDeals) filters.add(_buildFilterChip('Deals', 'Deals'));
    if (provider.filterSortBy) {
      filters.add(_buildFilterChip('Sort By', 'Sort By'));
    }
    if (provider.filterGender) {
      filters.add(_buildFilterChip('Gender', 'Gender'));
    }
    if (provider.filterMyPrice) {
      filters.add(_buildFilterChip('My Price', 'My Price'));
    }
    return filters;
  }

  Widget _buildFilterChip(String label, String filterType,
      {bool isIcon = false, String icon = ''}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: GestureDetector(
        onTap: () {
          _showFilterModal(context, filterType);
        },
        child: Container(
          constraints: BoxConstraints(maxWidth: 120),
          child: Chip(
            label: isIcon
                ? SvgPicture.asset(icon)
                : Text(
                    label,
                    style: TextStyle(color: Colors.white),
                  ),
            backgroundColor: ColorConst.kPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  void _showFilterModal(BuildContext context, String filterType) {
    Widget filterWidget;

    switch (filterType) {
      case 'Deals':
        filterWidget = DealsFilterWidget();
        break;
      case 'Sort By':
        filterWidget = SortByFilterWidget();
        break;
      case 'Gender':
        filterWidget = GenderFilterWidget();
        break;
      case 'My Price':
        filterWidget = MyPriceFilterWidget();
        break;
      default:
        filterWidget = CustomFilterModelBottomSheet(title: 'Filter');
    }

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 390,
        width: double.infinity,
        color: checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
                AppThemeMode.light
            ? ColorConst.white
            : ColorConst.darkPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<SearchProvider>().clearFilters();
                    },
                    child: Text(
                      'Clear',
                      style: FontStyleConst.huge.copyWith(
                        color: ColorConst.kPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    filterType,
                    style: FontStyleConst.huge
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(CupertinoIcons.xmark),
                  ),
                ],
              ),
            ),
            Expanded(child: filterWidget),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var searchProvider = context.watch<SearchProvider>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: searchProvider.searchedItems.isNotEmpty
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    const AppBackButton(),
                    Expanded(
                      child: CustomTextField(
                        hintText: 'Search ',
                        onChanged: (value) {
                          context.read<SearchProvider>().searchItem(value,
                              data: Provider.of<HomeProvider>(context,
                                      listen: false)
                                  .searchAll);
                        },
                        controller: _searchController,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: -15),
                        borderRadius: 24,
                        prefixIcon: SvgPicture.asset(
                          IconsConst.search,
                          height: 16,
                          width: 16,
                          fit: BoxFit.contain,
                          colorFilter: ColorFilter.mode(
                              checkModeAndGiveColor(
                                  mode:
                                      MediaQuery.of(context).platformBrightness,
                                  lightColor: ColorConst.black,
                                  darkColor: ColorConst.white),
                              BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                children: [
                  ..._buildSelectedFilters(searchProvider),
                ],
              ),
              searchProvider.searchedItems.isNotEmpty
                  ? const SizedBox()
                  : searchProvider.notFound == false
                      ? const SizedBox()
                      : const Spacer(),
              searchProvider.notFound == false
                  ? const CatergoryWidget()
                  : searchProvider.searchedItems.isNotEmpty
                      ? SizedBox(
                          child: GridView.builder(
                              padding: const EdgeInsets.only(top: 20),
                              shrinkWrap: true,
                              itemCount: searchProvider.searchedItems.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.6,
                                      crossAxisSpacing: 10),
                              itemBuilder: (context, index) {
                                var info = searchProvider.searchedItems
                                    .toList()[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CardWidget(model: info),
                                );
                              }),
                        )
                      : const SearchNotFoundWidget(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchNotFoundWidget extends StatelessWidget {
  const SearchNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/search.png',
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'No notification yet',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          CustomAppButon(
              isMaximumWidth: false,
              title: 'Explore Categories',
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => const CatigoriesPage()));
              })
        ],
      ),
    );
  }
}
