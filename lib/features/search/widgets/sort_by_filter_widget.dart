import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alfa/features/search/provider/search_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alfa/core/constants/color/color_const.dart';

class SortByFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();
    final selectedSortByFilters = provider.selectedSortByFilters;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFilterOption(context, 'Recommended', selectedSortByFilters),
        _buildFilterOption(context, 'Newest', selectedSortByFilters),
        _buildFilterOption(
            context, 'Lowest-Highest Price', selectedSortByFilters),
        _buildFilterOption(
            context, 'Highest-Lowest Price', selectedSortByFilters),
      ],
    );
  }

  Widget _buildFilterOption(
      BuildContext context, String label, Set<String> selectedFilters) {
    final isSelected = selectedFilters.contains(label);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          context.read<SearchProvider>().toggleSortByFilter(label);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: isSelected ? ColorConst.kPrimary : Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              if (isSelected)
                SvgPicture.asset(
                  'assets/icons/verify.svg',
                  height: 16,
                  width: 16,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
