import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

sealed class AppColorScheme {
  /// The ColorScheme made from the app colors
  const AppColorScheme._();

  /// App's light ColorScheme.
  static const ColorScheme light = ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.primaryLight,
  );

  /// App's dark ColorScheme. ( Not used as there was no dark scheme given )
  static const ColorScheme dark = ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.primaryLight,
  );
}
