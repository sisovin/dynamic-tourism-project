import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      accentColor: AppColors.accent,
      backgroundColor: AppColors.background,
      scaffoldBackgroundColor: AppColors.background,
      errorColor: AppColors.error,
      textTheme: TextTheme(
        headline1: AppTextStyles.heading1,
        headline2: AppTextStyles.heading2,
        headline3: AppTextStyles.heading3,
        bodyText1: AppTextStyles.bodyText,
        caption: AppTextStyles.caption,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.primary,
        textTheme: TextTheme(
          headline6: AppTextStyles.heading3.copyWith(color: AppColors.onPrimary),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.primaryVariant,
      accentColor: AppColors.accent,
      backgroundColor: AppColors.onBackground,
      scaffoldBackgroundColor: AppColors.onBackground,
      errorColor: AppColors.error,
      textTheme: TextTheme(
        headline1: AppTextStyles.heading1.copyWith(color: AppColors.onBackground),
        headline2: AppTextStyles.heading2.copyWith(color: AppColors.onBackground),
        headline3: AppTextStyles.heading3.copyWith(color: AppColors.onBackground),
        bodyText1: AppTextStyles.bodyText.copyWith(color: AppColors.onBackground),
        caption: AppTextStyles.caption.copyWith(color: AppColors.onBackground),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primaryVariant,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.primaryVariant,
        textTheme: TextTheme(
          headline6: AppTextStyles.heading3.copyWith(color: AppColors.onPrimary),
        ),
      ),
    );
  }
}
