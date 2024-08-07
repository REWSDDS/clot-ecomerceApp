import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/features/search/provider/search_provider.dart';

class GenderFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFilterOption(
          context,
          'Men',
          provider.selectedDealFilters.contains('Men'),
        ),
        _buildFilterOption(
          context,
          'Women',
          provider.selectedDealFilters.contains('Women'),
        ),
        _buildFilterOption(
          context,
          'Kids',
          provider.selectedDealFilters.contains('Kids'),
        ),
      ],
    );
  }

  Widget _buildFilterOption(BuildContext context, String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          context.read<SearchProvider>().toggleDealFilter(label);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: isSelected ? ColorConst.kPrimary : ColorConst.grey,
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
                  IconsConst.verify,
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
