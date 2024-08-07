import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/widgets/custom_app_bar.dart';
import 'package:alfa/core/widgets/custom_text_field.dart';
import 'package:alfa/features/card/provider/card_provider.dart';
import 'package:alfa/features/card/widgets/card_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  TextEditingController _cuponController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cuponController.addListener(() {
      _cuponController =
          TextEditingController(text: _cuponController.text.toUpperCase());
      setState(() {});
    });
  }

  @override
  void dispose() {
    _cuponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleText: 'Card',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    context.read<CardProvider>().removeAll();
                  },
                  child: Text(
                    'Remove all',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                  itemCount: context.watch<CardProvider>().cardList.length,
                  itemBuilder: (context, index) {
                    final cloth = context.watch<CardProvider>().cardList[index];
                    return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: checkModeAndGiveColor(
                            mode: MediaQuery.of(context).platformBrightness,
                            lightColor: ColorConst.grey,
                            darkColor: ColorConst.darkGrey,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  cloth.image,
                                  height: 64,
                                  width: 64,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress != null) {
                                      return const SizedBox(
                                        height: 64,
                                        width: 64,
                                        child: Center(
                                          child: CupertinoActivityIndicator(),
                                        ),
                                      );
                                    }
                                    return child;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cloth.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        'Size',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color: checkModeAndGiveColor(
                                                    mode: MediaQuery.of(context)
                                                        .platformBrightness,
                                                    lightColor:
                                                        ColorConst.darkGrey,
                                                    darkColor:
                                                        ColorConst.textGrey)),
                                      ),
                                      Text(
                                        ' - ${cloth.pickedSize!.name}'
                                            .toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!,
                                      ),
                                      const SizedBox(width: 16),
                                      Text(
                                        'Color',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color: checkModeAndGiveColor(
                                                    mode: MediaQuery.of(context)
                                                        .platformBrightness,
                                                    lightColor:
                                                        ColorConst.darkGrey,
                                                    darkColor:
                                                        ColorConst.textGrey)),
                                      ),
                                      Expanded(
                                        child: Container(
                                            height: 10,
                                            margin: EdgeInsets.only(
                                                left: 10, right: 50),
                                            color: Color(cloth.pickedColor!)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('\$${cloth.price}'),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: ColorConst.kPrimary,
                                        child: SvgPicture.asset(
                                            IconsConst.increment),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: ColorConst.kPrimary,
                                        child: SvgPicture.asset(
                                            IconsConst.decrement),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ));
                  }),
            ),
            const Spacer(),
            CardTextWidget(
              title: 'Total',
              amount: context.watch<CardProvider>().totalAmount,
            ),
            CardTextWidget(
              title: 'Shipping cost',
              amount: context.watch<CardProvider>().shippinCost,
            ),
            CardTextWidget(
              title: 'Tax',
              amount: (context.watch<CardProvider>().totalAmount * 0.12),
            ),
            CardTextWidget(
              title: 'Total',
              amount: (context.watch<CardProvider>().totalAmount +
                  (context.watch<CardProvider>().totalAmount * 0.12) +
                  5),
            ),
            Visibility(
              visible: context.watch<CardProvider>().isCuponTrue,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorConst.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      context.watch<CardProvider>().userCupon,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorConst.kPrimary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '-${context.watch<CardProvider>().discount}%',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Visibility(
              visible: context.watch<CardProvider>().isCuponTrue,
              child: CardTextWidget(
                title: 'After cupon',
                amount: (context.watch<CardProvider>().afterCupon),
              ),
            ),
            const SizedBox(height: 31),
            CustomTextField(
                prefixIcon: SvgPicture.asset(IconsConst.discount),
                suffixIcon: GestureDetector(
                  onTap: () {
                    context
                        .read<CardProvider>()
                        .checkCupon(_cuponController.text, context);
                    _cuponController.clear();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: ColorConst.kPrimary,
                      child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(IconsConst.chevronRight)),
                    ),
                  ),
                ),
                hintText: 'Enter cupon code',
                controller: _cuponController)
          ],
        ),
      ),
    );
  }
}
