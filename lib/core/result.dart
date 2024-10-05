import 'dart:async';

import 'package:flutter/foundation.dart';

import '../app/typedefs/typedefs.dart';
import 'models/app_alert_model.dart';

@immutable
sealed class Result<State> {
  /// The data case
  const factory Result.data(State state) = ResultData<State>;

  /// The error case
  const factory Result.error(AppAlert alert) = ResultError<State>;

  /// Automatically catches errors into a [ResultError] and convert successful
  /// values into a [ResultData].
  static Result<State> guard<State>(State Function() cb) {
    try {
      return Result<State>.data(cb());
    } on Exception catch (err, stack) {
      return Result<State>.error(
        AppAlert.exception(exception: err, stackTrace: stack),
      );
    } catch (err) {
      return Result<State>.error(
        AppAlert.error(message: 'Something went wrong'),
      );
    }
  }

  /// Automatically catches errors into a [ResultError] and convert successful
  /// values into a [ResultData].
  static FutureResult<State> guardAsync<State>(
    FutureOr<State> Function() cb,
  ) async {
    try {
      return Result<State>.data(await cb());
    } on Exception catch (err, stack) {
      return Result<State>.error(
        AppAlert.exception(exception: err, stackTrace: stack),
      );
    } catch (err) {
      return Result<State>.error(
        AppAlert.error(message: 'Something went wrong'),
      );
    }
  }

  /// Whether this is a [ResultData] or a [ResultError].
  bool get hasState;

  /// The state if this is a [ResultData], `null` otherwise.
  State? get stateOrNull;

  /// The state if this is a [ResultData], throws otherwise.
  State get requireState;

  R map<R>({
    required R Function(ResultData<State> data) data,
    required R Function(ResultError<State>) error,
  });

  R when<R>({
    required R Function(State data) data,
    required R Function(AppAlert alert) error,
  });
}

@immutable
final class ResultData<State> implements Result<State> {
  /// The data case
  const ResultData(this.state);

  /// The state
  final State state;

  @override
  bool get hasState => true;

  @override
  State? get stateOrNull => state;

  @override
  State get requireState => state;

  @override
  R map<R>({
    required R Function(ResultData<State> data) data,
    required R Function(ResultError<State>) error,
  }) =>
      data(this);

  @override
  R when<R>({
    required R Function(State data) data,
    required R Function(AppAlert alert) error,
  }) =>
      data(state);

  @override
  bool operator ==(Object other) =>
      other is ResultData<State> &&
      other.runtimeType == runtimeType &&
      other.state == state;

  @override
  int get hashCode => Object.hash(runtimeType, state);
}

@immutable
final class ResultError<State> implements Result<State> {
  /// The error case
  const ResultError(this.alert);

  /// The error
  final AppAlert alert;

  @override
  bool get hasState => false;

  @override
  State? get stateOrNull => null;

  @override
  State get requireState {
    Error.throwWithStackTrace(
      alert.message,
      alert.stackTrace ?? StackTrace.current,
    );
  }

  @override
  R map<R>({
    required R Function(ResultData<State> data) data,
    required R Function(ResultError<State>) error,
  }) =>
      error(this);

  @override
  R when<R>({
    required R Function(State data) data,
    required R Function(AppAlert alert) error,
  }) =>
      error(this.alert);

  @override
  bool operator ==(Object other) =>
      other is ResultError<State> &&
      other.runtimeType == runtimeType &&
      other.alert == alert;

  @override
  int get hashCode => Object.hash(runtimeType, alert);
}
