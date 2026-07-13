import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.background,

    // ===== Color Scheme =====
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.cardBackground,
      error: AppColors.error,
    ),

    // ===== AppBar =====
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.textWhite,
        size: AppSizes.iconSize24,
      ),
      titleTextStyle: TextStyle(
        fontSize: AppSizes.fontSize20,
        fontWeight: FontWeight.w700,
        color: AppColors.textWhite,
      ),
    ),

    // ===== Text Theme =====
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: AppSizes.fontSize40,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: AppSizes.fontSize24,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
      headlineSmall: TextStyle(
        fontSize: AppSizes.fontSize20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: AppSizes.fontSize20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: AppSizes.fontSize18,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: AppSizes.fontSize16,
        color: AppColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: AppSizes.fontSize14,
        color: AppColors.textPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: AppSizes.fontSize12,
        color: AppColors.textPrimary,
      ),
    ),

    // ===== Elevated Button =====
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textWhite,
        minimumSize: Size(
          double.infinity,
          AppSizes.spacingHeight52,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadius16,
          ),
        ),
        textStyle: TextStyle(
          fontSize: AppSizes.fontSize16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // ===== Text Button =====
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: TextStyle(
          fontSize: AppSizes.fontSize14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    // ===== Outlined Button =====
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: AppColors.primary,
          width: AppSizes.borderWidth2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadius16,
          ),
        ),
      ),
    ),

    // ===== Input Decoration =====
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputFill,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.spacingWidth16,
        vertical: AppSizes.spacingHeight16,
      ),
      hintStyle: TextStyle(
        color: AppColors.textSecondary,
        fontSize: AppSizes.fontSize14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.borderRadius16,
        ),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.borderRadius16,
        ),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.borderRadius16,
        ),
        borderSide: BorderSide(
          color: AppColors.primary,
          width: AppSizes.borderWidth2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.borderRadius16,
        ),
        borderSide: BorderSide(
          color: AppColors.error,
          width: AppSizes.borderWidth2,
        ),
      ),
    ),

    // ===== Card =====
    cardTheme: CardThemeData(
      color: AppColors.cardBackground,
      elevation: 2,
      margin: EdgeInsets.all(AppSizes.spacingWidth8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.borderRadius20,
        ),
      ),
    ),

    // ===== Divider =====
    dividerTheme: DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: AppSizes.spacingHeight20,
    ),

    // ===== Icons =====
    iconTheme: IconThemeData(
      color: AppColors.primary,
      size: AppSizes.iconSize24,
    ),
  );
}
