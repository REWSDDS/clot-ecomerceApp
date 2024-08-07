import 'package:animate_do/animate_do.dart';
import 'package:alfa/core/utils/local_db_service.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/core/widgets/custom_text_field.dart';
import 'package:alfa/features/sign_in/page/log_in_password_screen.dart';
import 'package:alfa/features/sign_in/provider/sign_in_provider.dart';
import 'package:alfa/features/sign_in/widgets/app_sign_in_widget.dart';
import 'package:alfa/features/sign_in/widgets/log_in_help_widget.dart';
import 'package:alfa/features/sign_up/page/create_account_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  // ! Form uchun
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
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
                    hasLeading: false,
                    controller: _emailController,
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
                    hintText: 'Email address',
                  ),
                ),
              ),
              CustomAppButon(
                  title: 'Continue',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      LocalDbService.saveData(
                          key: 'email', value: _emailController.text);
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const SignInPasswordScreen(),
                          ),
                          (_) => false);
                    }
                  }),
              LogInHelpWidget(
                title: 'Dont have an account ? ',
                subTitle: 'Create one',
                onTap: () {
                  // print('form key ${_formKey.currentState!.validate()}');
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const CreateAccountScreen()));
                },
              ),
              const SizedBox(height: 71),
              Column(
                children: List.generate(
                    context.watch<SignInProvider>().signInAppIcons.length,
                    (index) {
                  print('index $index');
                  final icon =
                      context.watch<SignInProvider>().signInAppIcons[index];
                  final title =
                      context.watch<SignInProvider>().signInAppTitles[index];
                  return AppSignInWidget(
                    icon: icon,
                    title: title,
                    onTap: () {},
                    isRigh: index % 2 == 0,
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
