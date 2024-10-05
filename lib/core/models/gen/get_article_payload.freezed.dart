// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../get_article_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetArticlePayload {
  String get country => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get sources => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  /// Create a copy of GetArticlePayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetArticlePayloadCopyWith<GetArticlePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetArticlePayloadCopyWith<$Res> {
  factory $GetArticlePayloadCopyWith(
          GetArticlePayload value, $Res Function(GetArticlePayload) then) =
      _$GetArticlePayloadCopyWithImpl<$Res, GetArticlePayload>;
  @useResult
  $Res call(
      {String country,
      String? category,
      String? sources,
      String? query,
      int pageSize,
      int page});
}

/// @nodoc
class _$GetArticlePayloadCopyWithImpl<$Res, $Val extends GetArticlePayload>
    implements $GetArticlePayloadCopyWith<$Res> {
  _$GetArticlePayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetArticlePayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? category = freezed,
    Object? sources = freezed,
    Object? query = freezed,
    Object? pageSize = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      sources: freezed == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as String?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetArticlePayloadImplCopyWith<$Res>
    implements $GetArticlePayloadCopyWith<$Res> {
  factory _$$GetArticlePayloadImplCopyWith(_$GetArticlePayloadImpl value,
          $Res Function(_$GetArticlePayloadImpl) then) =
      __$$GetArticlePayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String country,
      String? category,
      String? sources,
      String? query,
      int pageSize,
      int page});
}

/// @nodoc
class __$$GetArticlePayloadImplCopyWithImpl<$Res>
    extends _$GetArticlePayloadCopyWithImpl<$Res, _$GetArticlePayloadImpl>
    implements _$$GetArticlePayloadImplCopyWith<$Res> {
  __$$GetArticlePayloadImplCopyWithImpl(_$GetArticlePayloadImpl _value,
      $Res Function(_$GetArticlePayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetArticlePayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? category = freezed,
    Object? sources = freezed,
    Object? query = freezed,
    Object? pageSize = null,
    Object? page = null,
  }) {
    return _then(_$GetArticlePayloadImpl(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      sources: freezed == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as String?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetArticlePayloadImpl extends _GetArticlePayload {
  const _$GetArticlePayloadImpl(
      {this.country = 'in',
      this.category,
      this.sources,
      this.query,
      this.pageSize = 20,
      this.page = 1})
      : super._();

  @override
  @JsonKey()
  final String country;
  @override
  final String? category;
  @override
  final String? sources;
  @override
  final String? query;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'GetArticlePayload(country: $country, category: $category, sources: $sources, query: $query, pageSize: $pageSize, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetArticlePayloadImpl &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.sources, sources) || other.sources == sources) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, country, category, sources, query, pageSize, page);

  /// Create a copy of GetArticlePayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetArticlePayloadImplCopyWith<_$GetArticlePayloadImpl> get copyWith =>
      __$$GetArticlePayloadImplCopyWithImpl<_$GetArticlePayloadImpl>(
          this, _$identity);
}

abstract class _GetArticlePayload extends GetArticlePayload {
  const factory _GetArticlePayload(
      {final String country,
      final String? category,
      final String? sources,
      final String? query,
      final int pageSize,
      final int page}) = _$GetArticlePayloadImpl;
  const _GetArticlePayload._() : super._();

  @override
  String get country;
  @override
  String? get category;
  @override
  String? get sources;
  @override
  String? get query;
  @override
  int get pageSize;
  @override
  int get page;

  /// Create a copy of GetArticlePayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetArticlePayloadImplCopyWith<_$GetArticlePayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
