import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.onValidator,
      this.inputFormatters,
      this.suffixIcon,
      this.hasLeading = true,
      this.borderRadius = 4,
      this.onTap,
      this.prefixIcon,
      this.contentPadding,
      this.keyboardType,
      this.action = TextInputAction.done,
      this.onChanged,
      this.readOnly = false});

  final String hintText;
  final TextEditingController controller;
  final TextInputAction action;
  final double borderRadius;
  final Widget? prefixIcon;
  final EdgeInsets? contentPadding;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? onValidator;
  final bool hasLeading;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: onValidator,
      onTap: onTap,
      readOnly: readOnly,
      textInputAction: action,
      controller: controller,
      cursorHeight: 20,
      textAlign: TextAlign.start,
      textAlignVertical: const TextAlignVertical(y: 0.1),
      onChanged: onChanged,
      style: Theme.of(context).textTheme.headlineMedium!,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: contentPadding,
          labelStyle: Theme.of(context).textTheme.headlineSmall,
          prefixIcon: hasLeading
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: prefixIcon,
                )
              : null,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: checkCurrentTheme(
                          MediaQuery.of(context).platformBrightness) ==
                      AppThemeMode.light
                  ? ColorConst.darkGrey
                  : ColorConst.white.withOpacity(0.5)),
          filled: true,
          fillColor:
              checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
                      AppThemeMode.light
                  ? ColorConst.grey
                  : ColorConst.darkBg,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConst.red),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConst.red),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConst.kPrimary),
            borderRadius: BorderRadius.circular(borderRadius),
          )),
    );
  }
}
