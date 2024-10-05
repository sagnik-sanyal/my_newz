import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/article_model.freezed.dart';
part 'gen/article_model.g.dart';

@freezed
@JsonSerializable()
sealed class Article with _$Article {
  const factory Article({
    required Source source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, Object?> json) =>
      _$ArticleFromJson(json);

  /// Convert a list of JSON objects to a list of Article objects
  static List<Article> parseList(Object? json) {
    return switch (json) {
      final List<Object?> items =>
        items.cast<Map<String, Object?>>().map(Article.fromJson).toList(),
      _ => <Article>[],
    };
  }
}

@freezed
@JsonSerializable()
sealed class Source with _$Source {
  const factory Source({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) = _Source;

  factory Source.fromJson(Map<String, Object?> json) => _$SourceFromJson(json);
}
