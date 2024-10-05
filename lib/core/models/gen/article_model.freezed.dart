// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../article_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Article {
  Source get source => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  String? get urlToImage => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res, Article>;
  @useResult
  $Res call(
      {Source source,
      String? author,
      String? title,
      String? description,
      String? url,
      DateTime? publishedAt,
      String? urlToImage,
      String? content});

  $SourceCopyWith<$Res> get source;
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res, $Val extends Article>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? author = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? publishedAt = freezed,
    Object? urlToImage = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SourceCopyWith<$Res> get source {
    return $SourceCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticleImplCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$$ArticleImplCopyWith(
          _$ArticleImpl value, $Res Function(_$ArticleImpl) then) =
      __$$ArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Source source,
      String? author,
      String? title,
      String? description,
      String? url,
      DateTime? publishedAt,
      String? urlToImage,
      String? content});

  @override
  $SourceCopyWith<$Res> get source;
}

/// @nodoc
class __$$ArticleImplCopyWithImpl<$Res>
    extends _$ArticleCopyWithImpl<$Res, _$ArticleImpl>
    implements _$$ArticleImplCopyWith<$Res> {
  __$$ArticleImplCopyWithImpl(
      _$ArticleImpl _value, $Res Function(_$ArticleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? author = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? publishedAt = freezed,
    Object? urlToImage = freezed,
    Object? content = freezed,
  }) {
    return _then(_$ArticleImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ArticleImpl extends _Article {
  const _$ArticleImpl(
      {required this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.publishedAt,
      this.urlToImage,
      this.content})
      : super._();

  @override
  final Source source;
  @override
  final String? author;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final DateTime? publishedAt;
  @override
  final String? urlToImage;
  @override
  final String? content;

  @override
  String toString() {
    return 'Article(source: $source, author: $author, title: $title, description: $description, url: $url, publishedAt: $publishedAt, urlToImage: $urlToImage, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.urlToImage, urlToImage) ||
                other.urlToImage == urlToImage) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, author, title,
      description, url, publishedAt, urlToImage, content);

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      __$$ArticleImplCopyWithImpl<_$ArticleImpl>(this, _$identity);
}

abstract class _Article extends Article {
  const factory _Article(
      {required final Source source,
      final String? author,
      final String? title,
      final String? description,
      final String? url,
      final DateTime? publishedAt,
      final String? urlToImage,
      final String? content}) = _$ArticleImpl;
  const _Article._() : super._();

  @override
  Source get source;
  @override
  String? get author;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get url;
  @override
  DateTime? get publishedAt;
  @override
  String? get urlToImage;
  @override
  String? get content;

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Source {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SourceCopyWith<Source> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceCopyWith<$Res> {
  factory $SourceCopyWith(Source value, $Res Function(Source) then) =
      _$SourceCopyWithImpl<$Res, Source>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? url,
      String? category,
      String? language,
      String? country});
}

/// @nodoc
class _$SourceCopyWithImpl<$Res, $Val extends Source>
    implements $SourceCopyWith<$Res> {
  _$SourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? category = freezed,
    Object? language = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceImplCopyWith<$Res> implements $SourceCopyWith<$Res> {
  factory _$$SourceImplCopyWith(
          _$SourceImpl value, $Res Function(_$SourceImpl) then) =
      __$$SourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? url,
      String? category,
      String? language,
      String? country});
}

/// @nodoc
class __$$SourceImplCopyWithImpl<$Res>
    extends _$SourceCopyWithImpl<$Res, _$SourceImpl>
    implements _$$SourceImplCopyWith<$Res> {
  __$$SourceImplCopyWithImpl(
      _$SourceImpl _value, $Res Function(_$SourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? category = freezed,
    Object? language = freezed,
    Object? country = freezed,
  }) {
    return _then(_$SourceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SourceImpl extends _Source {
  const _$SourceImpl(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country})
      : super._();

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? category;
  @override
  final String? language;
  @override
  final String? country;

  @override
  String toString() {
    return 'Source(id: $id, name: $name, description: $description, url: $url, category: $category, language: $language, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, url, category, language, country);

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      __$$SourceImplCopyWithImpl<_$SourceImpl>(this, _$identity);
}

abstract class _Source extends Source {
  const factory _Source(
      {final String? id,
      final String? name,
      final String? description,
      final String? url,
      final String? category,
      final String? language,
      final String? country}) = _$SourceImpl;
  const _Source._() : super._();

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get category;
  @override
  String? get language;
  @override
  String? get country;

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
