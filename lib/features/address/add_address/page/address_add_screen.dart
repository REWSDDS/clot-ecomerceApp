import 'package:alfa/core/model/address_model.dart';
import 'package:alfa/core/widgets/app_back_button.dart';
import 'package:alfa/core/widgets/custom_app_bar.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/core/widgets/custom_text_field.dart';
import 'package:alfa/features/address/add_address/provider/add_address_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressAddScreen extends StatefulWidget {
  const AddressAddScreen({
    super.key,
  });
  @override
  State<AddressAddScreen> createState() => _AddressAddScreenState();
}

class _AddressAddScreenState extends State<AddressAddScreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        floatingActionButton:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:CustomAppButon(
            title: "Save",
            onTap: () {
              context.read<AddAddressProvider>().save(AddressModel(street: _addressController.text, city: _cityController.text, state: _stateController.text, zipCode: _zipCodeController.text));
              Navigator.pop(
                  context);
              },
          )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: const CustomAppBar(
          leading: AppBackButton(),
          isTitleText: true,
          titleText: "Add Address",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 42,
                ),
                CustomTextField(
                  hintText: "Street Address",
                  controller: _addressController,
                  hasLeading: false,
                  borderRadius: 8,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  hintText: "City",
                  controller: _cityController,
                  hasLeading: false,
                  borderRadius: 8,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                      hintText: "State",
                      controller: _stateController,
                      hasLeading: false,
                      borderRadius: 8,
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: CustomTextField(
                      hintText: "Zip Code",
                      controller: _zipCodeController,
                      hasLeading: false,
                      borderRadius: 8,
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
