import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.isTitleText = true,
      this.leading = const SizedBox(),
      this.titleText = '',
      this.center = const SizedBox(),
      this.action = const [],
      this.leadingWidth});

  final Widget leading;
  final bool isTitleText;
  final String titleText;
  final Widget center;
  final List<Widget> action;
  // * ? bu ozgaruvchi nal boladi
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    if (action.isNotEmpty) {
      action.add(const SizedBox(
        width: 10,
      ));
    }
    return AppBar(
      centerTitle: true,
      actions: action,
      leadingWidth: leadingWidth,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: leading,
      ),
      title: isTitleText
          ? Text(
              titleText,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            )
          : center,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
