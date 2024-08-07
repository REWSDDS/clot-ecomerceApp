import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/features/search/provider/search_provider.dart';

class MyPriceFilterWidget extends StatefulWidget {
  @override
  _MyPriceFilterWidgetState createState() => _MyPriceFilterWidgetState();
}

class _MyPriceFilterWidgetState extends State<MyPriceFilterWidget> {
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _applyPriceFilter() {
    final minPrice = _minPriceController.text.isNotEmpty
        ? double.tryParse(_minPriceController.text)
        : null;
    final maxPrice = _maxPriceController.text.isNotEmpty
        ? double.tryParse(_maxPriceController.text)
        : null;
    context.read<SearchProvider>().updatePriceFilter(minPrice, maxPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _minPriceController,
          decoration: InputDecoration(
            labelText: 'Min Price',
            filled: true,
            fillColor: ColorConst.grey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {},
        ),
        SizedBox(height: 16),
        TextField(
          controller: _maxPriceController,
          decoration: InputDecoration(
            labelText: 'Max Price',
            filled: true,
            fillColor: ColorConst.grey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {},
        ),
        SizedBox(height: 20),
        CustomAppButon(
          onTap: _applyPriceFilter,
          title: 'Search',
        ),
        SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom,
        )
      ],
    );
  }
}
