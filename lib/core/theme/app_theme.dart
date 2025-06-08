import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.pink,
    secondaryHeaderColor: AppColors.black,
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: AppColors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.black),
      titleMedium: TextStyle(color: AppColors.black),
      titleSmall: TextStyle(color: AppColors.black),
      labelLarge: TextStyle(color: AppColors.black),
      labelMedium: TextStyle(color: AppColors.black),
      labelSmall: TextStyle(color: AppColors.black),
      bodyLarge: TextStyle(color: AppColors.black),
      bodyMedium: TextStyle(color: AppColors.black),
      bodySmall: TextStyle(color: AppColors.black),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.pink,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.pink),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10000)),
        ),
        elevation: WidgetStateProperty.all(0),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        padding: WidgetStateProperty.all(const EdgeInsets.all(14)),
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
        fontSize: 12,
        color: AppColors.black[AppColors.colorCode40],
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(width: 1.w, color: AppColors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(width: 1.w, color: AppColors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(width: 1.w, color: AppColors.black),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(width: 1.w, color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(width: 1.w, color: AppColors.red),
      ),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return const TextStyle(color: AppColors.red);
        } else if (states.contains(WidgetState.focused)) {
          return const TextStyle(color: Colors.black);
        } else {
          return const TextStyle(color: AppColors.gray);
        }
      }),
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
            fontWeight: FontWeight.w400,
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
