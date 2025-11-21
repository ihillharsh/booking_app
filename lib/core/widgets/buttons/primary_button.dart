import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/theme/app_text_styles.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  /// Visual styles
  final bool isLoading;
  final bool isOutlined;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadiusType;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,

    /// Outline control
    this.isOutlined = false,

    /// Size
    this.width,
    this.margin,

    /// Colors
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderWidth = 1.5,
    this.borderRadiusType,

    /// Shape
    this.borderRadius = 20,

    /// Text
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bool disabled = isLoading || onPressed == null;

    final Color resolvedBg =
        isOutlined
            ? AppColors.transparent
            : (backgroundColor ?? AppColors.primary);

    final Color resolvedText =
        textColor ??
        (isOutlined ? (borderColor ?? AppColors.white) : AppColors.white);

    final Color resolvedBorder = borderColor ?? AppColors.white;

    return Container(
      width: width,
      margin: margin,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStateProperty.all(resolvedBg),
          foregroundColor: WidgetStateProperty.all(resolvedText),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius:
                  borderRadiusType ?? BorderRadius.circular(borderRadius.h),
              side:
                  isOutlined
                      ? BorderSide(color: resolvedBorder, width: borderWidth)
                      : BorderSide.none,
            ),
          ),
        ),
        child:
            isLoading
                ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),
                )
                : Text(
                  text,
                  style:
                      textStyle ??
                      AppTextStyles.instance.button.copyWith(
                        color: resolvedText,
                      ),
                ),
      ),
    );
  }
}
