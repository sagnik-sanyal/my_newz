import 'package:flutter/material.dart';

/// Extension methods for the [Widget] class
extension WidgetX on Widget {
  /// Adds padding to the widget
  Padding addPadding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }
}
