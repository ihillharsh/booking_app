import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surfaceLight,
        error: AppColors.error,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.black,
        inactiveTrackColor: AppColors.sliderColor,
        thumbColor: AppColors.black,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.h),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
        overlayColor: AppColors.transparent,
        trackHeight: 5.h,
        trackShape: RoundedRectSliderTrackShape(),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.instance.h1.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        displayMedium: AppTextStyles.instance.h2.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        displaySmall: AppTextStyles.instance.h3.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        headlineMedium: AppTextStyles.instance.h4.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        headlineSmall: AppTextStyles.instance.h5.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        titleLarge: AppTextStyles.instance.h6.copyWith(
          color: AppColors.textPrimaryLight,
        ),

        bodyLarge: AppTextStyles.instance.bodyLarge.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        bodyMedium: AppTextStyles.instance.bodyMedium.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        bodySmall: AppTextStyles.instance.bodySmall.copyWith(
          color: AppColors.textSecondaryLight,
        ),

        labelLarge: AppTextStyles.instance.button.copyWith(
          color: AppColors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          textStyle: AppTextStyles.instance.button,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.whiteOpacity50,
      ),
      inputDecorationTheme: InputDecorationTheme(
        // filled: true,
        // fillColor: AppColors.black,
        hintStyle: AppTextStyles.instance.bodyLarge.copyWith(
          color: AppColors.whiteOpacity50,
        ),
        labelStyle: AppTextStyles.instance.bodyLarge.copyWith(
          color: AppColors.whiteOpacity50,
        ),
        prefixIconColor: AppColors.white,
        suffixIconColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: const BorderSide(color: AppColors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: const BorderSide(color: AppColors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        checkColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          } else {
            return Colors.black;
          }
        }),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          } else {
            return Colors.transparent;
          }
        }),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surfaceDark,
        error: AppColors.error,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.black,
        inactiveTrackColor: AppColors.sliderColor,
        thumbColor: AppColors.black,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.h),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
        overlayColor: AppColors.transparent,
        trackHeight: 5.h,
        trackShape: RoundedRectSliderTrackShape(),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.instance.h1.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        displayMedium: AppTextStyles.instance.h2.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        displaySmall: AppTextStyles.instance.h3.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        headlineMedium: AppTextStyles.instance.h4.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        headlineSmall: AppTextStyles.instance.h5.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        titleLarge: AppTextStyles.instance.h6.copyWith(
          color: AppColors.textPrimaryDark,
        ),

        bodyLarge: AppTextStyles.instance.bodyLarge.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        bodyMedium: AppTextStyles.instance.bodyMedium.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        bodySmall: AppTextStyles.instance.bodySmall.copyWith(
          color: AppColors.textSecondaryDark,
        ),

        labelLarge: AppTextStyles.instance.button.copyWith(
          color: AppColors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          textStyle: AppTextStyles.instance.button,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.whiteOpacity50,
      ),
      inputDecorationTheme: InputDecorationTheme(
        // filled: true,
        // fillColor: AppColors.black,
        suffixIconColor: AppColors.white,
        prefixIconColor: AppColors.white,
        hintStyle: AppTextStyles.instance.bodyLarge.copyWith(
          color: AppColors.whiteOpacity50,
        ),
        labelStyle: AppTextStyles.instance.bodyLarge.copyWith(
          color: AppColors.whiteOpacity50,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: const BorderSide(color: AppColors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: const BorderSide(color: AppColors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        checkColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          } else {
            return Colors.black;
          }
        }),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          } else {
            return Colors.transparent;
          }
        }),
      ),
    );
  }
}
