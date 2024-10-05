import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show Alignment, BuildContext;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toastification/toastification.dart';

import '../../shared/widgets/app_text.dart';
import '../exceptions/dio_exceptions.dart';

part 'gen/app_alert_model.freezed.dart';

enum AlertMode {
  silent,
  info,
  error,
  exception;

  ToastificationType? get toastType {
    return switch (this) {
      AlertMode.error => ToastificationType.error,
      AlertMode.exception => ToastificationType.warning,
      AlertMode.info => ToastificationType.info,
      _ => null,
    };
  }
}

@freezed
sealed class AppAlert with _$AppAlert {
  /// Alert model to show toast messages and handle exceptions
  const factory AppAlert({
    required String message,
    required AlertMode mode,
    StackTrace? stackTrace,
    int? code,
  }) = _AppAlert;

  factory AppAlert.alert({
    required AlertMode mode,
    required String message,
    int? code,
  }) {
    if (mode == AlertMode.error) log(message, name: 'AppAlert', error: message);
    return AppAlert(message: message, mode: mode, code: code);
  }

  factory AppAlert.exception({
    required Exception exception,
    bool testMode = false,
    StackTrace stackTrace = StackTrace.empty,
  }) {
    final String message = switch (exception) {
      final ApiException e => e.errorMessage,
      final FormatException e => e.message,
      final FirebaseAuthException e => e.friendly,
      _ => 'An error occurred while processing your request',
    };
    if (testMode) log(message, stackTrace: stackTrace);
    return AppAlert(message: message, mode: AlertMode.exception);
  }

  factory AppAlert.error({required String message}) {
    return AppAlert(message: message, mode: AlertMode.error);
  }

  factory AppAlert.silent() {
    return const AppAlert(message: '', mode: AlertMode.silent);
  }

  const AppAlert._();

  /// Show toast message based on alert type
  void showToast({
    String? customMessage,
    ToastificationType? type,
    BuildContext? context,
    Duration autoCloseDuration = const Duration(seconds: 2),
  }) {
    toastification.show(
      description: AppText.regular(customMessage ?? message),
      context: context,
      style: ToastificationStyle.flatColored,
      showProgressBar: false,
      alignment: Alignment.topCenter,
      autoCloseDuration: autoCloseDuration,
      animationDuration: const Duration(milliseconds: 500),
      type: type ?? mode.toastType,
    );
  }
}

extension _FirebaseAuthExceptionX on FirebaseAuthException {
  String get friendly {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-credential':
        return 'User credentials are invalid.';
      case 'user-not-found':
        return 'There is no user record corresponding to this identifier.';
      case 'wrong-password':
        return 'The password is invalid or the user does not have a password.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'too-many-requests':
        return 'Too many requests. Try again later.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      default:
        return 'An error occurred while processing your request';
    }
  }
}
