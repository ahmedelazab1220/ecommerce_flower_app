import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.pink,
    secondaryHeaderColor: AppColors.black,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: AppColors.white,
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(color: AppColors.black),
      titleMedium: const TextStyle(color: AppColors.black),
      titleSmall: const TextStyle(color: AppColors.black),
      labelLarge: const TextStyle(color: AppColors.black),
      labelMedium: const TextStyle(color: AppColors.black),
      labelSmall: const TextStyle(color: AppColors.black),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      bodyMedium: const TextStyle(color: AppColors.black),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.pink,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(343.w, 48.h)),
        backgroundColor: WidgetStateProperty.all(AppColors.pink),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10000)),
        ),
        elevation: WidgetStateProperty.all(0),
        textStyle: WidgetStateProperty.all(
           TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColors.white,
          ),
        ),
        padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorStyle: const TextStyle(color: AppColors.red, fontSize: 12),
      contentPadding: const EdgeInsets.all(16),
      iconColor: AppColors.pink,
      hintStyle: TextStyle(
        color: AppColors.black[AppColors.colorCode30],
        fontSize: 14,
      ),
      prefixIconColor: AppColors.black,
      suffixIconColor: AppColors.black,
      labelStyle: TextStyle(
        fontSize: 14,
        color: AppColors.black[AppColors.colorCode40],
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.black),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.red),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.all(AppColors.pink),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.pink,
          ),
        ),
      ),
    ),
    checkboxTheme: const CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(AppColors.white),
      side: BorderSide(color: AppColors.pink),
      overlayColor: WidgetStatePropertyAll(AppColors.pink),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        foregroundColor: AppColors.pink,
        side: const BorderSide(color: AppColors.pink),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.pink,
      unselectedItemColor: AppColors.white[AppColors.colorCode80],
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),
  );
}
