import 'package:app_initial_structure/core/theme/app_text_styles.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../utils/utility_functions.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool filled;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final Color? fillColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final InputBorder? focusBorder;
  final InputBorder? inputBorder;
  final InputBorder? enableBorder;
  final InputBorder? disableBorder;
  final InputBorder? errorBorder;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.filled = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.fillColor,
    this.textStyle,
    this.hintStyle,
    this.border,
    this.inputBorder,
    this.disableBorder,
    this.enableBorder,
    this.focusBorder,
    this.errorBorder,
    this.contentPadding
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
        hintStyle: hintStyle,
        border: border,
        focusedBorder: focusBorder,
        enabledBorder: enableBorder,
        errorBorder: errorBorder,
        disabledBorder: disableBorder,
        filled: filled,
        alignLabelWithHint: true,
        contentPadding: contentPadding
      ),
      style:
          textStyle ??
          AppTextStyles.instance.bodyMedium.copyWith(color: Colors.white),
      onTapOutside: (event) {
        UtilityFunctions.hideKeyboard(context);
      },
    );
  }
}
