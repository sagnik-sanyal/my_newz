import 'package:flutter/material.dart';

import '../../app/constants/ui_constants.dart';

/// Extension methods for the [List<Widget>] class
extension ListWidgetX on List<Widget> {
  /// add seperator between widgets
  List<Widget> addSpacing(double spacing) {
    final List<Widget> list = <Widget>[];
    final SizedBox box = SizedBox(height: spacing);
    for (int i = 0; i < length; i++) {
      list.add(this[i]);
      if (i != length - 1) list.add(box);
    }
    return list;
  }
}

/// Extension methods for the [Widget] class
extension WidgetX on Widget {
  /// Adds padding to the widget
  Padding padding([EdgeInsetsGeometry? padding]) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      child: this,
    );
  }

  /// Adds sliver padding to the widget
  SliverPadding sliverPadding([EdgeInsetsGeometry? padding]) {
    return SliverPadding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      sliver: this,
    );
  }
}
