
import 'package:flutter/material.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({
    super.key,
    required this.title,
    this.titleColor,
    required this.onSeeAllPressed,
  });

  final String title;
  final Color? titleColor;
  final VoidCallback onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold, color: titleColor),
          ),
          TextButton(
              onPressed: onSeeAllPressed,
              child: Text(
                'See all',
                style: Theme.of(context).textTheme.headlineMedium,
              ))
        ],
      ),
    );
  }
}
