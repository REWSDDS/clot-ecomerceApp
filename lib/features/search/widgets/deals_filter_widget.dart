import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:alfa/features/search/provider/search_provider.dart';
import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';

class DealsFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFilterButton(context, 'On Sale', 'On Sale',
            provider.selectedDealFilters.contains('On Sale')),
        _buildFilterButton(context, 'Free Shipping', 'Free Shipping',
            provider.selectedDealFilters.contains('Free Shipping')),
      ],
    );
  }

  Widget _buildFilterButton(
      BuildContext context, String label, String filterValue, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          context.read<SearchProvider>().toggleDealFilter(filterValue);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? ColorConst.kPrimary : ColorConst.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? ColorConst.white : ColorConst.black,
              ),
            ),
            if (isSelected)
              SvgPicture.asset(
                IconsConst.verify,
                height: 16,
                width: 16,
              ),
          ],
        ),
      ),
    );
  }
}
