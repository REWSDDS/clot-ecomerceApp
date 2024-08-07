import 'package:animate_do/animate_do.dart';
import 'package:alfa/core/utils/local_db_service.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/core/widgets/custom_text_field.dart';
import 'package:alfa/features/forget_password/page/forget_password_screen.dart';
import 'package:alfa/features/main/page/main_screen.dart';
import 'package:alfa/features/sign_in/widgets/log_in_help_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPasswordScreen extends StatefulWidget {
  const SignInPasswordScreen({super.key});

  @override
  State<SignInPasswordScreen> createState() => _SignInPasswordScreenState();
}

class _SignInPasswordScreenState extends State<SignInPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              SlideInLeft(
                delay: const Duration(microseconds: 500),
                child: Text(
                  'Sign in',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: SlideInRight(
                  delay: const Duration(microseconds: 1500),
                  child: CustomTextField(
                    onValidator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 8) {
                        return 'Must have 8 letters min';
                      }
                      return null;
                    },
                    hasLeading: false,
                    controller: _passwordController,
                    hintText: 'Password',
                  ),
                ),
              ),
              CustomAppButon(
                title: 'Continue',
                onTap: () {
                  print(
                      'value ${LocalDbService.getStorageIntance.read('email')}');
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                        (_) => false);
                  }
                },
              ),
              LogInHelpWidget(
                title: 'Forget password ? ',
                subTitle: 'Reset',
                onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const ForgetPasswordScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
