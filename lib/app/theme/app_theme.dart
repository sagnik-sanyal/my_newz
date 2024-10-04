import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
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
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledForegroundColor: Colors.white,
          disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
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
      ),
    );
  }
}
