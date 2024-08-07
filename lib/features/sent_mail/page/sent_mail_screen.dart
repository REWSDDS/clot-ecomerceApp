import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/features/sign_in/page/log_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SentMailScreen extends StatelessWidget {
  const SentMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ! Element 1
              Image.asset(
                'assets/images/mail.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 24),
              // ! Element 2
              Text(
                'We sent you an email to reset\nyour password',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              CustomAppButon(
                  isMaximumWidth: false,
                  title: 'Return to Login',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const LogInScreen(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
