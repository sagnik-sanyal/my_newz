import 'package:flutter/material.dart';

/// Handy extensions on the [BuildContext] class
extension BuildContextX on BuildContext {
  /// Returns the [ThemeData] from the current [BuildContext]
  ThemeData get theme => Theme.of(this);

  /// TextScaler from the context
  TextScaler get textScaler => MediaQuery.textScalerOf(this);

  /// Navigate to a new route
  void push<T>(Widget page) {
    Navigator.of(this).push<T>(MaterialPageRoute<T>(builder: (_) => page));
  }

  /// Pop the current route
  void pop<T>([T? result]) => Navigator.of(this).pop<T>(result);
}
