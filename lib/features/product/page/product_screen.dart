import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/font_style/font_style.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/model/cloth_model.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/widgets/custom_snack_bar.dart';
import 'package:alfa/features/card/provider/card_provider.dart';
import 'package:alfa/features/product/provider/product_provider.dart';
import 'package:alfa/features/product/widgets/custom_app_bar_widget.dart';
import 'package:alfa/features/product/widgets/custom_choice_widget.dart';
import 'package:alfa/features/product/widgets/custom_show_modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.model});

  final ClothModel model;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().setAllValuesToDefault();
    context.read<ProductProvider>().getProductPrice(widget.model.price.toInt());
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        model: widget.model,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 248,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 248,
                    width: 161,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.model.image),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 15),
              child: Text(context.watch<ProductProvider>().title,
                  style: FontStyleConst.medium),
            ),
            Text(
              '\$${context.watch<ProductProvider>().price}',
              style: FontStyleConst.medium.copyWith(
                  color: ColorConst.kPrimary, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, top: 33),
              child: Column(
                children: [
                  CustomChoiceWidget(
                    title: 'Size',
                    action: Row(
                      children: [
                        Text(
                            context.watch<ProductProvider>().clothSize?.name ??
                                '',
                            style: FontStyleConst.medium),
                        const SizedBox(width: 29),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return CustomShowModalBottomSheet(
                                  title: 'Size',
                                  isColor: false,
                                  sizes: widget.model.size,
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            IconsConst.dropButton,
                            colorFilter: ColorFilter.mode(
                                checkCurrentTheme(MediaQuery.of(context)
                                            .platformBrightness) ==
                                        AppThemeMode.light
                                    ? ColorConst.black
                                    : ColorConst.white,
                                BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomChoiceWidget(
                    title: 'Color',
                    action: Row(
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: context
                                      .watch<ProductProvider>()
                                      .colorCode !=
                                  null
                              ? Color(
                                  context.watch<ProductProvider>().colorCode!)
                              : Colors.transparent,
                        ),
                        const SizedBox(width: 29),
                        InkWell(
                          onTap: () {
                            // *
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return CustomShowModalBottomSheet(
                                  title: 'Color',
                                  isColor: true,
                                  colorCode: widget.model.color,
                                  colorName: widget.model.colorName,
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            IconsConst.dropButton,
                            colorFilter: ColorFilter.mode(
                                checkCurrentTheme(MediaQuery.of(context)
                                            .platformBrightness) ==
                                        AppThemeMode.light
                                    ? ColorConst.black
                                    : ColorConst.white,
                                BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomChoiceWidget(
                    title: 'Quantity',
                    action: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<ProductProvider>().increment();
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorConst.kPrimary,
                            child: SvgPicture.asset(IconsConst.increment),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text(context
                              .watch<ProductProvider>()
                              .quantity
                              .toString()),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<ProductProvider>().decrement();
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorConst.kPrimary,
                            child: SvgPicture.asset(IconsConst.decrement),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          if (Provider.of<ProductProvider>(context, listen: false).clothSize !=
                  null &&
              Provider.of<ProductProvider>(context, listen: false).colorCode !=
                  null) {
            final newModel = ClothModel(
                image: widget.model.image,
                name: widget.model.name,
                price: widget.model.price,
                colorName: widget.model.colorName,
                color: widget.model.color,
                size: widget.model.size,
                pickedColor:
                    Provider.of<ProductProvider>(context, listen: false)
                        .colorCode,
                pickedSize: Provider.of<ProductProvider>(context, listen: false)
                    .clothSize);
            Provider.of<CardProvider>(context, listen: false).addToCard(
              newModel,
              amount:
                  Provider.of<ProductProvider>(context, listen: false).quantity,
            );
            Provider.of<CardProvider>(context, listen: false)
                .updateTotalAmount();
            showCustomSnackBar(
                context: context,
                message: 'Added to Card ${newModel.name}',
                backgroundColor: Color(
                    Provider.of<ProductProvider>(context, listen: false)
                        .colorCode!));
          } else {
            showCustomSnackBar(
                context: context,
                message: 'Size and Color are required',
                backgroundColor: ColorConst.red);
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorConst.kPrimary),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '\$${context.watch<ProductProvider>().price * context.watch<ProductProvider>().quantity}',
                    style: FontStyleConst.medium.copyWith(
                        color: ColorConst.white, fontWeight: FontWeight.bold)),
                Text('Add to Bag',
                    style: FontStyleConst.medium
                        .copyWith(color: ColorConst.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
