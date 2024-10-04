import 'package:flutter/foundation.dart';

@immutable
sealed class Result<State> {
  /// The data case
  const factory Result.data(State state) = ResultData<State>;

  /// The error case
  const factory Result.error(Object error, StackTrace stackTrace) =
      ResultError<State>;

  /// Automatically catches errors into a [ResultError] and convert successful
  /// values into a [ResultData].
  static Result<State> guard<State>(State Function() cb) {
    try {
      return Result<State>.data(cb());
    } catch (err, stack) {
      return Result<State>.error(err, stack);
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
    required R Function(Object error, StackTrace stackTrace) error,
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
    required R Function(Object error, StackTrace stackTrace) error,
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
  const ResultError(this.error, this.stackTrace);

  /// The error
  final Object error;

  /// The stack trace
  final StackTrace stackTrace;

  @override
  bool get hasState => false;

  @override
  State? get stateOrNull => null;

  @override
  State get requireState => Error.throwWithStackTrace(error, stackTrace);

  @override
  R map<R>({
    required R Function(ResultData<State> data) data,
    required R Function(ResultError<State>) error,
  }) =>
      error(this);

  @override
  R when<R>({
    required R Function(State data) data,
    required R Function(Object error, StackTrace stackTrace) error,
  }) =>
      error(this.error, stackTrace);

  @override
  bool operator ==(Object other) =>
      other is ResultError<State> &&
      other.runtimeType == runtimeType &&
      other.stackTrace == stackTrace &&
      other.error == error;

  @override
  int get hashCode => Object.hash(runtimeType, error, stackTrace);
}
