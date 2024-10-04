import 'package:flutter/foundation.dart';

@immutable
sealed class AsyncValue<T> {
  const AsyncValue._();

  /// Creates an [AsyncValue] with a data.
  const factory AsyncValue.data(T value) = AsyncData<T>;

  /// Creates an [AsyncValue] in loading state.
  const factory AsyncValue.loading() = AsyncLoading<T>;

  /// Creates an [AsyncValue] in the error state.
  const factory AsyncValue.error(Object error, StackTrace stackTrace) =
      AsyncError<T>;

  /// Whether some new value is currently asynchronously loading.
  ///
  /// Even if [isLoading] is true, it is still possible for [hasValue]/[hasError]
  /// to also be true.
  bool get isLoading;

  /// Whether [value] is set.
  bool get hasValue;

  /// The value currently exposed.
  T? get value;

  /// The [error].
  Object? get error;

  /// The stacktrace of [error].
  StackTrace? get stackTrace;

  /// Perform some action based on the current state of the [AsyncValue].
  ///
  /// This allows reading the content of an [AsyncValue] in a type-safe way,
  /// without potentially ignoring to handle a case.
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  });

  /// Clone an [AsyncValue], merging it with [previous].
  ///
  /// When doing so, the resulting [AsyncValue] can contain the information
  /// about multiple state at once.
  /// For example, this allows an [AsyncError] to contain a [value], or even
  /// [AsyncLoading] to contain both a [value] and an [error].
  ///
  /// The optional [isRefresh] flag (true by default) represents whether the
  /// provider rebuilt by [Ref.refresh]/[Ref.invalidate] (if true)
  /// or instead by [Ref.watch] (if false).
  /// This changes the default behavior of [when] and sets the [isReloading]/
  /// [isRefreshing] flags accordingly.
  AsyncValue<T> copyWithPrevious(
    AsyncValue<T> previous, {
    bool isRefresh = true,
  });

  /// The opposite of [copyWithPrevious], reverting to the raw [AsyncValue]
  /// with no information on the previous state.
  AsyncValue<T> unwrapPrevious() {
    return map(
      data: (AsyncData<T> d) {
        if (d.isLoading) return AsyncLoading<T>();
        return AsyncData<T>(d.value);
      },
      error: (AsyncError<T> e) {
        if (e.isLoading) return AsyncLoading<T>();
        return AsyncError<T>(e.error, e.stackTrace);
      },
      loading: (AsyncLoading<T> l) => AsyncLoading<T>(),
    );
  }

  @override
  String toString() {
    final String content = <String>[
      if (isLoading && this is! AsyncLoading) 'isLoading: $isLoading',
      if (hasValue) 'value: $value',
      if (hasError) ...<String>[
        'error: $error',
        'stackTrace: $stackTrace',
      ],
    ].join(', ');

    return '($content)';
  }

  @override
  bool operator ==(Object other) =>
      runtimeType == other.runtimeType &&
      other is AsyncValue<T> &&
      other.isLoading == isLoading &&
      other.hasValue == hasValue &&
      other.error == error &&
      other.stackTrace == stackTrace &&
      other.valueOrNull == valueOrNull;

  @override
  int get hashCode => Object.hash(
        runtimeType,
        isLoading,
        hasValue,
        valueOrNull,
        error,
        stackTrace,
      );
}

final class AsyncData<T> extends AsyncValue<T> {
  const AsyncData(T value)
      : this._(value, isLoading: false, error: null, stackTrace: null);

  const AsyncData._(
    this.value, {
    required this.isLoading,
    required this.error,
    required this.stackTrace,
  }) : super._();

  @override
  final T value;

  @override
  bool get hasValue => true;

  @override
  final bool isLoading;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;

  @override
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  }) =>
      data(this);

  @override
  AsyncData<T> copyWithPrevious(
    AsyncValue<T> previous, {
    bool isRefresh = true,
  }) =>
      this;
}

final class AsyncLoading<T> extends AsyncValue<T> {
  const AsyncLoading()
      : hasValue = false,
        value = null,
        error = null,
        stackTrace = null,
        super._();

  const AsyncLoading._({
    required this.hasValue,
    required this.value,
    required this.error,
    required this.stackTrace,
  }) : super._();

  @override
  bool get isLoading => true;

  @override
  final bool hasValue;

  @override
  final T? value;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;

  @override
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  }) =>
      loading(this);

  @override
  AsyncValue<T> copyWithPrevious(
    AsyncValue<T> previous, {
    bool isRefresh = true,
  }) {
    if (isRefresh) {
      return previous.map(
        data: (AsyncData<T> d) => AsyncData<T>._(
          d.value,
          isLoading: true,
          error: d.error,
          stackTrace: d.stackTrace,
        ),
        error: (AsyncError<T> e) => AsyncError<T>._(
          e.error,
          isLoading: true,
          value: e.valueOrNull,
          stackTrace: e.stackTrace,
          hasValue: e.hasValue,
        ),
        loading: (_) => this,
      );
    } else {
      return previous.map(
        data: (AsyncData<T> d) => AsyncLoading<T>._(
          hasValue: true,
          value: d.valueOrNull,
          error: d.error,
          stackTrace: d.stackTrace,
        ),
        error: (AsyncError<T> e) => AsyncLoading<T>._(
          hasValue: e.hasValue,
          value: e.valueOrNull,
          error: e.error,
          stackTrace: e.stackTrace,
        ),
        loading: (AsyncLoading<T> e) => e,
      );
    }
  }
}

final class AsyncError<T> extends AsyncValue<T> {
  const AsyncError(Object error, StackTrace stackTrace)
      : this._(
          error,
          stackTrace: stackTrace,
          isLoading: false,
          hasValue: false,
          value: null,
        );

  const AsyncError._(
    this.error, {
    required this.stackTrace,
    required T? value,
    required this.hasValue,
    required this.isLoading,
  })  : _value = value,
        super._();

  @override
  final bool isLoading;

  @override
  final bool hasValue;

  final T? _value;

  @override
  T? get value {
    if (!hasValue) Error.throwWithStackTrace(error, stackTrace);
    return _value;
  }

  @override
  final Object error;

  @override
  final StackTrace stackTrace;

  @override
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  }) =>
      error(this);

  @override
  AsyncError<T> copyWithPrevious(
    AsyncValue<T> previous, {
    bool isRefresh = true,
  }) =>
      AsyncError<T>._(
        error,
        stackTrace: stackTrace,
        isLoading: isLoading,
        value: previous.valueOrNull,
        hasValue: previous.hasValue,
      );
}

/// Extension methods on [AsyncValue]
extension AsyncValueX<T> on AsyncValue<T> {
  /// If [hasValue] is true, returns the value.
  /// Otherwise if [hasError], rethrows the error.
  T get requireValue {
    if (hasValue) return value as T;
    if (hasError) throw Error.throwWithStackTrace(error!, stackTrace!);
    throw StateError(
      '''Tried to call `requireValue` on an `AsyncValue` that has no value: $this''',
    );
  }

  /// Return the value or null
  T? get valueOrNull {
    if (hasValue) return value;
    return null;
  }

  /// Whether the associated provider was forced to recompute even though
  /// it was already in a loading state.
  bool get isRefreshing =>
      isLoading && (hasValue || hasError) && this is! AsyncLoading;

  /// Whether [error] is not null.
  bool get hasError => error != null;

  /// Upcast [AsyncValue] into an [AsyncData]
  AsyncData<T>? get asData => mapOrNull(data: (AsyncData<T> d) => d);

  /// Upcast [AsyncValue] into an [AsyncError]
  AsyncError<T>? get asError => mapOrNull(error: (AsyncError<T> e) => e);

  /// Shorthand for [when] to handle only the `data` case.
  AsyncValue<R> whenData<R>(R Function(T value) cb) {
    return map(
      data: (AsyncData<T> d) {
        try {
          return AsyncData<R>._(
            cb(d.value),
            isLoading: d.isLoading,
            error: d.error,
            stackTrace: d.stackTrace,
          );
        } catch (err, stack) {
          return AsyncError<R>._(
            err,
            stackTrace: stack,
            isLoading: d.isLoading,
            value: null,
            hasValue: false,
          );
        }
      },
      error: (AsyncError<T> e) => AsyncError<R>._(
        e.error,
        stackTrace: e.stackTrace,
        isLoading: e.isLoading,
        value: null,
        hasValue: false,
      ),
      loading: (AsyncLoading<T> l) => AsyncLoading<R>(),
    );
  }

  /// Switch-case over the state of the [AsyncValue] and return
  /// a new [AsyncValue].
  R maybeWhen<R>({
    required R Function() orElse,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    R Function(T data)? data,
    R Function(Object error, StackTrace stackTrace)? error,
    R Function()? loading,
  }) =>
      when(
        skipError: skipError,
        skipLoadingOnRefresh: skipLoadingOnRefresh,
        skipLoadingOnReload: skipLoadingOnReload,
        data: data ?? (_) => orElse(),
        error: error ?? (Object err, StackTrace stack) => orElse(),
        loading: loading ?? () => orElse(),
      );

  /// Performs an action based on the state of the [AsyncValue].
  R when<R>({
    required R Function(T data) data,
    required R Function(Object error, StackTrace stackTrace) error,
    required R Function() loading,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
  }) {
    if (isLoading) {
      if (!(isRefreshing && skipLoadingOnReload)) return loading();
    }

    if (hasError && (!hasValue || !skipError)) {
      return error(this.error!, stackTrace!);
    }

    return data(requireValue);
  }

  /// Perform some actions based on the state of the [AsyncValue],
  /// or call orElse
  R maybeMap<R>({
    required R Function() orElse,
    R Function(AsyncData<T> data)? data,
    R Function(AsyncError<T> error)? error,
    R Function(AsyncLoading<T> loading)? loading,
  }) =>
      map(
        data: (AsyncData<T> d) {
          if (data != null) return data(d);
          return orElse();
        },
        error: (AsyncError<T> d) {
          if (error != null) return error(d);
          return orElse();
        },
        loading: (AsyncLoading<T> d) {
          if (loading != null) return loading(d);
          return orElse();
        },
      );

  /// Perform some actions based on the state of the [AsyncValue] or else null
  R? mapOrNull<R>({
    R? Function(AsyncData<T> data)? data,
    R? Function(AsyncError<T> error)? error,
    R? Function(AsyncLoading<T> loading)? loading,
  }) =>
      map(
        data: (AsyncData<T> d) => data?.call(d),
        error: (AsyncError<T> d) => error?.call(d),
        loading: (AsyncLoading<T> d) => loading?.call(d),
      );
}
