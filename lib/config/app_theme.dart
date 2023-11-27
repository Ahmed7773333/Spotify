import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_styles.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      titleTextStyle: AppStyles.title,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFB4B4B4)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: const OutlineInputBorder(),
        focusColor: AppColors.onPrimary,
        focusedBorder: const OutlineInputBorder(),
        disabledBorder: const OutlineInputBorder(),
        border: const OutlineInputBorder(),
        hintStyle: AppStyles.searchStyle),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(398, 64),
        backgroundColor: AppColors.primary,
        textStyle: AppStyles.titleOfItems,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: const BorderSide(color: AppColors.primary),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        textStyle: AppStyles.titleOfItems,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.onPrimary,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedLabelStyle: AppStyles.barStyle,
      unselectedLabelStyle:
          AppStyles.barStyle.copyWith(color: AppColors.iconColor),
      selectedItemColor: Colors.white,
      unselectedItemColor: AppColors.iconColor,
    ),
  );
}
