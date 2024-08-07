import 'package:flutter/material.dart';

class LogInHelpWidget extends StatelessWidget {
  const LogInHelpWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            subTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
