import 'package:flutter/material.dart';

/// Handy extensions on the [BuildContext] class
extension BuildContextX on BuildContext {
  /// Returns the [ThemeData] from the current [BuildContext]
  ThemeData get theme => Theme.of(this);

  /// TextScaler from the context
  TextScaler get textScaler => MediaQuery.textScalerOf(this);
}
