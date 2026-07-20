import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_sizes.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  // ===== Light Theme =====
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.background,
        cardColor: AppColors.cardBackground,

        // Color Scheme
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: AppColors.textWhite,
          secondary: AppColors.accent,
          surface: AppColors.cardBackground,
          onSurface: AppColors.textPrimary,
          onSurfaceVariant: AppColors.textSecondary,
          error: AppColors.error,
          outline: AppColors.border,
        ),

        // AppBar Theme
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: AppColors.textPrimary,
            size: AppSizes.iconSize24,
          ),
          titleTextStyle: TextStyle(
            fontSize: AppSizes.fontSize20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),

        // Text Theme
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
            color: AppColors.textSecondary,
          ),
        ),

        // Button Themes
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

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: TextStyle(
              fontSize: AppSizes.fontSize14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

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

        // Input Theme
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

        // Card Theme
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

        // Divider Theme
        dividerTheme: DividerThemeData(
          color: AppColors.divider,
          thickness: 1,
          space: AppSizes.spacingHeight20,
        ),

        // Icon Theme
        iconTheme: IconThemeData(
          color: AppColors.primary,
          size: AppSizes.iconSize24,
        ),
      );

  // ===== Dark Theme =====
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        cardColor: AppColors.darkCardBackground,

        colorScheme: const ColorScheme.dark(
          primary: AppColors.darkPrimary,
          onPrimary: AppColors.textWhite,
          secondary: AppColors.accent,
          surface: AppColors.darkCardBackground,
          onSurface: AppColors.darkTextPrimary,
          onSurfaceVariant: AppColors.darkTextSecondary,
          error: AppColors.error,
          outline: AppColors.darkBorder,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkBackground,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: AppColors.darkTextPrimary,
            size: AppSizes.iconSize24,
          ),
          titleTextStyle: TextStyle(
            fontSize: AppSizes.fontSize20,
            fontWeight: FontWeight.w700,
            color: AppColors.darkTextPrimary,
          ),
        ),

        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: AppSizes.fontSize40,
            fontWeight: FontWeight.bold,
            color: AppColors.darkTextPrimary,
          ),
          headlineMedium: TextStyle(
            fontSize: AppSizes.fontSize24,
            fontWeight: FontWeight.w700,
            color: AppColors.darkTextPrimary,
          ),
          headlineSmall: TextStyle(
            fontSize: AppSizes.fontSize20,
            fontWeight: FontWeight.w600,
            color: AppColors.darkTextPrimary,
          ),
          titleLarge: TextStyle(
            fontSize: AppSizes.fontSize20,
            fontWeight: FontWeight.w600,
            color: AppColors.darkTextPrimary,
          ),
          titleMedium: TextStyle(
            fontSize: AppSizes.fontSize18,
            fontWeight: FontWeight.w500,
            color: AppColors.darkTextPrimary,
          ),
          bodyLarge: TextStyle(
            fontSize: AppSizes.fontSize16,
            color: AppColors.darkTextPrimary,
          ),
          bodyMedium: TextStyle(
            fontSize: AppSizes.fontSize14,
            color: AppColors.darkTextPrimary,
          ),
          bodySmall: TextStyle(
            fontSize: AppSizes.fontSize12,
            color: AppColors.darkTextSecondary,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkPrimary,
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

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.darkPrimaryLight,
            textStyle: TextStyle(
              fontSize: AppSizes.fontSize14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: AppColors.darkPrimary,
              width: AppSizes.borderWidth2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppSizes.borderRadius16,
              ),
            ),
          ),
        ),

        cardTheme: CardThemeData(
          color: AppColors.darkCardBackground,
          elevation: 2,
          margin: EdgeInsets.all(AppSizes.spacingWidth8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.borderRadius20,
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkInputFill,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppSizes.spacingWidth16,
            vertical: AppSizes.spacingHeight16,
          ),
          hintStyle: TextStyle(
            color: AppColors.darkTextSecondary,
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
              color: AppColors.darkPrimary,
              width: AppSizes.borderWidth2,
            ),
          ),
        ),

        dividerTheme: DividerThemeData(
          color: AppColors.darkBorder,
          thickness: 1,
          space: AppSizes.spacingHeight20,
        ),

        iconTheme: IconThemeData(
          color: AppColors.darkPrimary,
          size: AppSizes.iconSize24,
        ),
      );
}

// ===== Context Theme Extensions for Clean Dynamic Theming =====
extension AppThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get cardBackgroundColor => Theme.of(this).cardColor;
  Color get textPrimaryColor =>
      Theme.of(this).textTheme.bodyLarge?.color ??
      (isDarkMode ? AppColors.darkTextPrimary : AppColors.textPrimary);
  Color get textSecondaryColor =>
      isDarkMode ? AppColors.darkTextSecondary : AppColors.textSecondary;

  Color get tileBackgroundColor =>
      isDarkMode ? AppColors.darkTileColor : AppColors.tileColor;
  Color get inputFillColor =>
      Theme.of(this).inputDecorationTheme.fillColor ??
      (isDarkMode ? AppColors.darkInputFill : AppColors.inputFill);
  Color get borderColor =>
      isDarkMode ? AppColors.darkBorder : AppColors.border;
}
