import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/features/search/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomFilterModelBottomSheet extends StatelessWidget {
  const CustomFilterModelBottomSheet({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      color: checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
              AppThemeMode.light
          ? ColorConst.white
          : ColorConst.darkPurple,
      child: SafeArea(
        top: false,
        right: false,
        left: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterRow(context, 'Price',
                context.watch<SearchProvider>().filterPrice, 'Price'),
            _buildFilterRow(context, 'Deals',
                context.watch<SearchProvider>().filterDeals, 'Deals'),
            _buildFilterRow(context, 'Sort By',
                context.watch<SearchProvider>().filterSortBy, 'Sort By'),
            _buildFilterRow(context, 'Gender',
                context.watch<SearchProvider>().filterGender, 'Gender'),
            _buildFilterRow(context, 'My Price',
                context.watch<SearchProvider>().filterMyPrice, 'My Price'),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterRow(
      BuildContext context, String label, bool value, String filterType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Switch.adaptive(
            value: value,
            onChanged: (newValue) {
              context
                  .read<SearchProvider>()
                  .changeModeFilter(newValue, filterType);
            },
          ),
        ],
      ),
    );
  }
}
