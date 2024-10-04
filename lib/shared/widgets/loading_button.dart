import 'package:flutter/material.dart';

import '../../app/constants/app_colors.dart';
import 'dots_loader.dart';

@immutable
class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    this.onPressed,
    this.child,
    this.style,
    this.isLoading = false,
  });

  final Widget? child;
  final bool isLoading;
  final ButtonStyle? style;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: isLoading ? null : onPressed,
      child: isLoading ? _buildLoader() : child,
    );
  }

  /// Builds the loader
  SizedBox _buildLoader() {
    return const SizedBox.square(
      dimension: 20,
      child: DotsLoader(size: 25, color: AppColors.primaryLight),
    );
  }
}
