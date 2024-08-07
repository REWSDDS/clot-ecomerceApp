import 'package:alfa/core/utils/check_keyboard_visiblity.dart';
import 'package:alfa/core/utils/local_db_service.dart';
import 'package:alfa/core/widgets/app_back_button.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/core/widgets/custom_text_field.dart';
import 'package:alfa/features/about_yourself/page/about_your_self_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('bottom insets ${MediaQuery.of(context).viewInsets.bottom}');
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const AppBackButton(),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomAppButon(
            title: 'Continue',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                LocalDbService.saveData(
                    key: 'firstName', value: _firstNameController.text);
                LocalDbService.saveData(
                    key: 'lastName', value: _lastNameController.text);
                LocalDbService.saveData(
                    key: 'email', value: _emailController.text);
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const AboutYourSelfScreen(),
                  ),
                );
              }
            }),
      ),
      // body: ,
      body: GestureDetector(
        onTap: () {
          // *  Klavatura(Harfalar Jamlanmasi Bosish uchun) ochiq bolgan payti yopish uchun
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Create Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 32),
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                                hasLeading: false,
                                action: TextInputAction.next,
                                hintText: 'Firstname',
                                onValidator: (firstName) {
                                  if (firstName!.isEmpty) {
                                    return 'Firstname is required';
                                  }
                                  return null;
                                },
                                controller: _firstNameController),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: CustomTextField(
                                  hasLeading: false,
                                  action: TextInputAction.next,
                                  hintText: 'Lastname',
                                  onValidator: (lastName) {
                                    if (lastName!.isEmpty) {
                                      return 'Lastname is required';
                                    }
                                    return null;
                                  },
                                  controller: _lastNameController),
                            ),
                            CustomTextField(
                                hasLeading: false,
                                action: TextInputAction.next,
                                hintText: 'Email Adress',
                                onValidator: (email) {
                                  if (email!.isEmpty) {
                                    return 'fill the gap';
                                  }
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(email)) {
                                    return 'Invalid email format';
                                  }
                                  return null;
                                },
                                controller: _emailController),
                            const SizedBox(height: 16),
                            CustomTextField(
                                hasLeading: false,
                                action: TextInputAction.go,
                                hintText: 'Password',
                                onValidator: (password) {
                                  if (password!.isEmpty) {
                                    return 'Password is required';
                                  }
                                  if (password.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
                                controller: _passwordController),
                          ],
                        )),
                    const SizedBox(height: 40),
                    checkKeyBoardVisibilty(context)
                        ? const SizedBox(height: 100)
                        : const SizedBox()
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
