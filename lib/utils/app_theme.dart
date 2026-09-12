import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBgColor,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.mainLightColor,
      unselectedItemColor: AppColors.lightGreyColor,
      selectedLabelStyle: AppStyles.regular12MainLightColor,
      unselectedLabelStyle: AppStyles.regular12GreyColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainLightColor,
      foregroundColor: AppColors.whiteColor,
      shape: CircleBorder(),
    ),
    cardColor: AppColors.mainLightColor,

    dividerColor: AppColors.strokeWhiteColor,

    textTheme: TextTheme(
      headlineLarge: AppStyles.semi20Black,
      headlineMedium: AppStyles.medium16Black,
      bodyLarge: AppStyles.regular14grey,
      headlineSmall: AppStyles.semi24MainLightColor,
      labelMedium: AppStyles.medium16MainColor,
      labelSmall: AppStyles.medium18MainColor,
      labelLarge: AppStyles.semi14MainLightColor,
      bodyMedium: AppStyles.semi16MainLightColor,
      bodySmall: AppStyles.medium14Black,
      titleLarge: AppStyles.regular14MainLightColor,
      titleMedium: AppStyles.medium20Black,
      titleSmall: AppStyles.medium18Black,
    ),
  );

  // =========================
  // Dark Theme
  // =========================

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBgColor,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBgColor,
      selectedItemColor: AppColors.mainDarkColor,
      unselectedItemColor: AppColors.lightGreyColor,
      selectedLabelStyle: AppStyles.regular12MainDarkColor,
      unselectedLabelStyle: AppStyles.regular12GreyColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainDarkColor,
      foregroundColor: AppColors.whiteColor,
      shape: CircleBorder(),
    ),

    cardColor: AppColors.mainDarkColor,

    dividerColor: AppColors.mainLightColor,

    textTheme: TextTheme(
      headlineLarge: AppStyles.semi20white,
      headlineMedium: AppStyles.medium16White,
      bodyLarge: AppStyles.regular14whiteDarkColor,
      headlineSmall: AppStyles.semi24white,
      labelMedium: AppStyles.medium16MainDarkColor,
      labelSmall: AppStyles.medium18MainDarkColor,
      labelLarge: AppStyles.semi14MainDarkColor,
      bodyMedium: AppStyles.semi16MainDarkColor,
      bodySmall: AppStyles.medium14White,
      titleLarge: AppStyles.regular14MainDarkColor,
      titleMedium: AppStyles.medium20whiteDarkColor,
      titleSmall: AppStyles.medium18White,
    ),
  );
}