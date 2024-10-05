import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/article_model.freezed.dart';
part 'gen/article_model.g.dart';

@freezed
@JsonSerializable(createToJson: false)
sealed class Article with _$Article {
  const factory Article({
    required Source source,
    String? author,
    String? title,
    String? description,
    String? url,
    DateTime? publishedAt,
    String? urlToImage,
    String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, Object?> json) =>
      _$ArticleFromJson(json);
}

@freezed
@JsonSerializable(createToJson: false)
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

  const Source._();

  factory Source.fromJson(Map<String, Object?> json) => _$SourceFromJson(json);
}
