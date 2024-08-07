import 'package:animate_do/animate_do.dart';
import 'package:alfa/core/widgets/app_back_button.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/core/widgets/custom_text_field.dart';
import 'package:alfa/features/sent_mail/page/sent_mail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SlideInLeft(
                delay: const Duration(microseconds: 500),
                child: Text(
                  'Forget password',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 32),
              SlideInRight(
                delay: const Duration(microseconds: 1500),
                child: CustomTextField(
                  controller: _emailController,
                  hintText: 'Enter email adress',
                ),
              ),
              CustomAppButon(
                title: 'Continue',
                onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const SentMailScreen(),
                    ),
                    (_) => false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
