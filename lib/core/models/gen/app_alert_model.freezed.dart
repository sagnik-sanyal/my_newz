// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../app_alert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppAlert {
  String get message => throw _privateConstructorUsedError;
  AlertMode get mode => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;

  /// Create a copy of AppAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppAlertCopyWith<AppAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppAlertCopyWith<$Res> {
  factory $AppAlertCopyWith(AppAlert value, $Res Function(AppAlert) then) =
      _$AppAlertCopyWithImpl<$Res, AppAlert>;
  @useResult
  $Res call(
      {String message, AlertMode mode, StackTrace? stackTrace, int? code});
}

/// @nodoc
class _$AppAlertCopyWithImpl<$Res, $Val extends AppAlert>
    implements $AppAlertCopyWith<$Res> {
  _$AppAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? mode = null,
    Object? stackTrace = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AlertMode,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppAlertImplCopyWith<$Res>
    implements $AppAlertCopyWith<$Res> {
  factory _$$AppAlertImplCopyWith(
          _$AppAlertImpl value, $Res Function(_$AppAlertImpl) then) =
      __$$AppAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, AlertMode mode, StackTrace? stackTrace, int? code});
}

/// @nodoc
class __$$AppAlertImplCopyWithImpl<$Res>
    extends _$AppAlertCopyWithImpl<$Res, _$AppAlertImpl>
    implements _$$AppAlertImplCopyWith<$Res> {
  __$$AppAlertImplCopyWithImpl(
      _$AppAlertImpl _value, $Res Function(_$AppAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? mode = null,
    Object? stackTrace = freezed,
    Object? code = freezed,
  }) {
    return _then(_$AppAlertImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AlertMode,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$AppAlertImpl extends _AppAlert {
  const _$AppAlertImpl(
      {required this.message, required this.mode, this.stackTrace, this.code})
      : super._();

  @override
  final String message;
  @override
  final AlertMode mode;
  @override
  final StackTrace? stackTrace;
  @override
  final int? code;

  @override
  String toString() {
    return 'AppAlert(message: $message, mode: $mode, stackTrace: $stackTrace, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppAlertImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, mode, stackTrace, code);

  /// Create a copy of AppAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppAlertImplCopyWith<_$AppAlertImpl> get copyWith =>
      __$$AppAlertImplCopyWithImpl<_$AppAlertImpl>(this, _$identity);
}

abstract class _AppAlert extends AppAlert {
  const factory _AppAlert(
      {required final String message,
      required final AlertMode mode,
      final StackTrace? stackTrace,
      final int? code}) = _$AppAlertImpl;
  const _AppAlert._() : super._();

  @override
  String get message;
  @override
  AlertMode get mode;
  @override
  StackTrace? get stackTrace;
  @override
  int? get code;

  /// Create a copy of AppAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppAlertImplCopyWith<_$AppAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
