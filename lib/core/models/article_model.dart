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
