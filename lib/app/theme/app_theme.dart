import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/ui_constants.dart';
import 'color_scheme.dart';

sealed class AppTheme {
  const AppTheme._();

  /// Create the theme from the brightness
  static ThemeData use(Brightness brightness) {
    final bool isLightMode = brightness == Brightness.light;
    final ColorScheme scheme =
        isLightMode ? AppColorScheme.light : AppColorScheme.dark;
    return ThemeData(
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      visualDensity: VisualDensity.comfortable,
      typography: Typography.material2021(
        colorScheme: scheme,
        platform: defaultTargetPlatform,
      ),
      primaryColor: scheme.primary,
      appBarTheme: const AppBarTheme(elevation: 0, scrolledUnderElevation: 0),
      primaryTextTheme: GoogleFonts.poppinsTextTheme(),
      textTheme: GoogleFonts.poppinsTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(180, 49),
          disabledForegroundColor: Colors.white,
          disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.primary),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hintStyle: const TextStyle(color: AppColors.grey, fontSize: 14),
        fillColor: scheme.surface,
        suffixIconColor: AppColors.primary,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: BorderSide(color: scheme.primary),
          gapPadding: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          gapPadding: 10,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          gapPadding: 10,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          gapPadding: 10,
        ),
      ),
    );
  }
}
