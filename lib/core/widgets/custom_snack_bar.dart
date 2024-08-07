import 'package:flutter/material.dart';

showCustomSnackBar({
  required BuildContext context,
  required String message,
  required Color backgroundColor,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(12),
            backgroundColor: backgroundColor,
            content: Text(message, style: Theme.of(context).textTheme.headlineMedium,)),
        snackBarAnimationStyle: AnimationStyle(
            curve: Curves.bounceInOut, duration: const Duration(seconds: 1)));
