import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/utils/allvalidators.dart';
import 'package:alfa/core/widgets/app_back_button.dart';
import 'package:alfa/core/widgets/custom_app_bar.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/core/widgets/custom_snack_bar.dart';
import 'package:alfa/core/widgets/custom_text_field.dart';
import 'package:alfa/features/payment/provider/payment_provider.dart';

class PaymentAddScreen extends StatefulWidget {
  const PaymentAddScreen({super.key});

  @override
  State<PaymentAddScreen> createState() => _PaymentAddScreenState();
}

class _PaymentAddScreenState extends State<PaymentAddScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _expController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ValueNotifier<String> cardIcon = ValueNotifier('');

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cvvController.dispose();
    _expController.dispose();
    _cardHolderNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomAppButon(
              title: 'Save',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.read<PaymentProvider>().addCard(
                      cvv: _cvvController.text,
                      exp: _expController.text,
                      cardHolderName: _cardHolderNameController.text,
                      cardNumber: _cardNumberController.text,
                      context: context);
                } else {
                  showCustomSnackBar(
                      context: context,
                      message: 'Form is not valid!',
                      backgroundColor: Colors.red);
                }
              }),
        ),
        appBar: const CustomAppBar(
          leadingWidth: 80,
          leading: AppBackButton(),
          titleText: 'Add card',
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 42, right: 24, left: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  suffixIcon: ValueListenableBuilder(
                      valueListenable: cardIcon,
                      builder: (context, __, _) {
                        if (cardIcon.value.isNotEmpty) {
                          return Image.asset(
                            cardIcon.value,
                            height: 8,
                            width: 8,
                            fit: BoxFit.contain,
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                  inputFormatters: [
                    MaskTextInputFormatter(mask: "#### #### #### ####")
                  ],
                  action: TextInputAction.next,
                  hasLeading: false,
                  hintText: 'Card number',
                  onValidator: (value) {
                    if (value!.length < 16) {
                      return 'must have 16 numbers';
                    }
                    if (value.isEmpty) {
                      return 'Card number is required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: _cardNumberController,
                  onChanged: (value) {
                    if (value.length == 4) {
                      if (value == '9860') {
                        cardIcon.value = IconsConst.humo;
                      } else {
                        cardIcon.value = IconsConst.uzcard;
                      }
                    } else if (value.length < 4) {
                      cardIcon.value = '';
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                              onValidator: emtypValidator,
                              keyboardType: TextInputType.number,
                              action: TextInputAction.next,
                              hasLeading: false,
                              inputFormatters: [
                                MaskTextInputFormatter(mask: "###")
                              ],
                              hintText: 'CVV',
                              controller: _cvvController)),
                      const SizedBox(width: 20),
                      Expanded(
                          child: CustomTextField(
                              onValidator: emtypValidator,
                              inputFormatters: [
                                MaskTextInputFormatter(mask: "##/##")
                              ],
                              keyboardType: TextInputType.number,
                              action: TextInputAction.next,
                              hasLeading: false,
                              hintText: 'Exp',
                              controller: _expController))
                    ],
                  ),
                ),
                CustomTextField(
                    onValidator: emtypValidator,
                    keyboardType: TextInputType.multiline,
                    hasLeading: false,
                    hintText: 'Cardholder name',
                    action: TextInputAction.done,
                    controller: _cardHolderNameController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
