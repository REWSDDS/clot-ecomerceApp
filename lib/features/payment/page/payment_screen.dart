import 'package:animate_do/animate_do.dart';
import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/model/payment_model.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/widgets/app_back_button.dart';
import 'package:alfa/core/widgets/custom_app_bar.dart';
import 'package:alfa/features/payment/page/payment_add_screen.dart';
import 'package:alfa/features/payment/provider/payment_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PaymentProvider>().getCards();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            CupertinoPageRoute(builder: (_) => const PaymentAddScreen())),
        child: SvgPicture.asset(IconsConst.increment),
      ),
      appBar: const CustomAppBar(
        leadingWidth: 80,
        leading: AppBackButton(),
        titleText: 'Payment',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              'Card',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            ListView.builder(
                shrinkWrap: true,
                itemCount: context.watch<PaymentProvider>().cards.length,
                itemBuilder: (context, index) {
                  return BounceInLeft(
                    child: PlasticCardWidget(
                      paymentModel: context.watch<PaymentProvider>().cards[index],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class PlasticCardWidget extends StatelessWidget {
  const PlasticCardWidget({
    super.key,
    required this.paymentModel,
  });

  final PaymentModel paymentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: checkModeAndGiveColor(
          mode: MediaQuery.of(context).platformBrightness,
          lightColor: ColorConst.grey,
          darkColor: ColorConst.darkGrey,
        ),
      ),
      child: ListTile(
        title: Row(
          children: [
            Text(
              '**** ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              paymentModel.cardNuber.substring(15, 18),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(width: 19),
            Image.asset(
              paymentModel.karta == Karta.humo
                  ? IconsConst.humo
                  : IconsConst.uzcard,
              height: 36,
              width: 36,
              fit: BoxFit.cover,
            )
          ],
        ),
        trailing: SvgPicture.asset(
          IconsConst.chevronRight,
          colorFilter: ColorFilter.mode(
              checkModeAndGiveColor(
                  mode: MediaQuery.of(context).platformBrightness,
                  lightColor: ColorConst.black,
                  darkColor: ColorConst.white),
              BlendMode.srcIn),
        ),
      ),
    );
  }
}
