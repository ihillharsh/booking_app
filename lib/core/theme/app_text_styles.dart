import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

/// A helper class for managing text styles in the application
class AppTextStyles {
  static AppTextStyles? _instance;

  AppTextStyles._();

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  // Headings
  TextStyle get h1 => TextStyle(
    fontSize: 32.fSize,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  TextStyle get h2 => TextStyle(
    fontSize: 30.fSize,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.5,
  );

  TextStyle get h3 => TextStyle(
    fontSize: 24.fSize,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  TextStyle get h4 => TextStyle(
    fontSize: 22.fSize,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  TextStyle get h5 => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  TextStyle get h6 => TextStyle(
    fontSize: 18.fSize,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

// Body text
  TextStyle get bodyLarge => TextStyle(
    fontSize: 16.fSize,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
  );

  TextStyle get bodyLargeSemibold => TextStyle(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  TextStyle get bodyLargeBold => TextStyle(
    fontSize: 16.fSize,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    color: AppColors.white
  );

  TextStyle get bodyMedium => TextStyle(
    fontSize: 14.fSize,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
  );

  TextStyle get bodyMediumSemibold => TextStyle(
    fontSize: 14.fSize,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
  );

  TextStyle get bodyMediumBold => TextStyle(
    fontSize: 14.fSize,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.25,
  );

  TextStyle get bodySmall => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
    color: AppColors.white
  );

  TextStyle get bodySmallSemibold => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
  );

  TextStyle get bodySmallBold => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.4,
  );


  // Button text
  TextStyle get button => TextStyle(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  );

  // Caption
  TextStyle get caption => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
  );

  // Overline
  TextStyle get overline => TextStyle(
    fontSize: 10.fSize,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    color: AppColors.white
  );
}

extension TextStyleModifiers on TextStyle {
  TextStyle get black => copyWith(color: Colors.black);
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get primary => copyWith(color: AppColors.primary);
  TextStyle get red => copyWith(color: Colors.red);
  TextStyle  customColor(Color x) => copyWith(color: x);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle  semiBoldCustom(Color x) => copyWith(fontWeight: FontWeight.w600,color: x);
  TextStyle  regularCustom(Color x) => copyWith(fontWeight: FontWeight.normal,color: x);

}
