import 'dart:async';

import 'package:flutter/foundation.dart';

import '../app/typedefs/typedefs.dart';
import 'models/app_alert_model.dart';

@immutable
sealed class Result<S> {
  /// The data case
  const factory Result.data(S state) = ResultData<S>;

  /// The error case
  const factory Result.error(AppAlert alert) = ResultError<S>;

  /// Automatically catches errors into a [ResultError] and convert successful
  /// values into a [ResultData].
  static Result<S> guard<S>(S Function() cb) {
    try {
      return Result<S>.data(cb());
    } on Exception catch (e, s) {
      return Result<S>.error(AppAlert.exception(exception: e, stackTrace: s));
    } catch (_) {
      return Result<S>.error(
        AppAlert.error(message: 'Something went wrong'),
      );
    }
  }

  /// Automatically catches errors into a [ResultError] and convert successful
  /// values into a [ResultData].
  static FutureResult<S> guardAsync<S>(
    FutureOr<S> Function() cb,
  ) async {
    try {
      return Result<S>.data(await cb());
    } on Exception catch (e, s) {
      return Result<S>.error(AppAlert.exception(exception: e, stackTrace: s));
    } catch (err) {
      return Result<S>.error(
        AppAlert.error(message: 'Something went wrong'),
      );
    }
  }

  /// Whether this is a [ResultData] or a [ResultError].
  bool get hasState;

  /// The state if this is a [ResultData], `null` otherwise.
  S? get stateOrNull;

  /// The state if this is a [ResultData], throws otherwise.
  S get requireState;

  R map<R>({
    required R Function(ResultData<S> data) data,
    required R Function(ResultError<S>) error,
  });

  R when<R>({
    required R Function(S data) data,
    required R Function(AppAlert alert) error,
  });
}

@immutable
final class ResultData<S> implements Result<S> {
  /// The data case
  const ResultData(this.state);

  /// The state
  final S state;

  @override
  bool get hasState => true;

  @override
  S? get stateOrNull => state;

  @override
  S get requireState => state;

  @override
  R map<R>({
    required R Function(ResultData<S> data) data,
    required R Function(ResultError<S>) error,
  }) =>
      data(this);

  @override
  R when<R>({
    required R Function(S data) data,
    required R Function(AppAlert alert) error,
  }) =>
      data(state);

  @override
  bool operator ==(Object other) =>
      other is ResultData<S> &&
      other.runtimeType == runtimeType &&
      other.state == state;

  @override
  int get hashCode => Object.hash(runtimeType, state);
}

@immutable
final class ResultError<S> implements Result<S> {
  /// The error case
  const ResultError(this.alert);

  /// The error
  final AppAlert alert;

  @override
  bool get hasState => false;

  @override
  S? get stateOrNull => null;

  @override
  S get requireState {
    Error.throwWithStackTrace(
      alert.message,
      alert.stackTrace ?? StackTrace.current,
    );
  }

  @override
  R map<R>({
    required R Function(ResultData<S> data) data,
    required R Function(ResultError<S>) error,
  }) =>
      error(this);

  @override
  R when<R>({
    required R Function(S data) data,
    required R Function(AppAlert alert) error,
  }) =>
      error(this.alert);

  @override
  bool operator ==(Object other) =>
      other is ResultError<S> &&
      other.runtimeType == runtimeType &&
      other.alert == alert;

  @override
  int get hashCode => Object.hash(runtimeType, alert);
}
