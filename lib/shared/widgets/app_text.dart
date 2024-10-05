import 'package:flutter/material.dart';

import '../extensions/context_ext.dart';

enum FontWeightType {
  regular,
  medium,
  bold;

  /// Returns the [FontWeight] type
  FontWeight type() {
    return switch (this) {
      FontWeightType.regular => FontWeight.w400,
      FontWeightType.medium => FontWeight.w500,
      FontWeightType.bold => FontWeight.w700,
    };
  }
}

@immutable
class AppText extends StatelessWidget {
  const AppText._(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.configKey,
    this.scalable = true,
  });

  factory AppText.bold(
    String text, {
    Color? color,
    Key? key,
    FontWeightType fontWeight = FontWeightType.bold,
    bool scalable = true,
    String? configKey,
    TextAlign? textAlign,
    int? maxLines,
    double? fontSize = 14.0,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      AppText._(
        text,
        key: key,
        textStyle: TextStyle(
          fontWeight: fontWeight.type(),
          color: color,
          fontSize: fontSize,
          decoration: decoration,
        ),
        scalable: scalable,
        configKey: configKey,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
      );

  factory AppText.medium(
    String text, {
    Color? color,
    Key? key,
    FontWeightType fontWeight = FontWeightType.medium,
    bool scalable = true,
    String? configKey,
    TextAlign? textAlign,
    int? maxLines,
    double? fontSize = 14.0,
  }) {
    return AppText._(
      text,
      key: key,
      textStyle: TextStyle(
        fontWeight: fontWeight.type(),
        color: color,
        fontSize: fontSize,
      ),
      scalable: scalable,
      configKey: configKey,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  factory AppText.regular(
    String text, {
    Color? color,
    Key? key,
    FontWeightType? fontWeight = FontWeightType.regular,
    bool scalable = true,
    String? configKey,
    TextAlign? textAlign,
    int? maxLines,
    double? fontSize = 14.0,
  }) {
    return AppText._(
      text,
      textStyle: TextStyle(
        fontWeight: fontWeight?.type(),
        color: color,
        fontSize: fontSize,
      ),
      key: key,
      scalable: scalable,
      configKey: configKey,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  final TextStyle? textStyle;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool scalable;
  final String? configKey;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textScaler: scalable ? context.textScaler : TextScaler.noScaling,
    );
  }
}
