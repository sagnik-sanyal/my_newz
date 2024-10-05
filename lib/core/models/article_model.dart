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

  const Article._();

  factory Article.fromJson(Map<String, Object?> json) =>
      _$ArticleFromJson(json);

  /// Create a new instance of [Article] with mock data
  factory Article.mock() {
    return Article(
      source: Source.mock(),
      author: 'John Doe',
      title: 'Lorem ipsum dolor sit amet',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing eli',
      url: 'https://www.example.com',
      publishedAt: DateTime.now(),
      urlToImage: 'https://www.example.com/image.jpg',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    );
  }

  String get timeAgo {
    if (publishedAt == null) return '';
    final Duration diff = DateTime.now().difference(publishedAt!);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Just now';
  }
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

  /// Create a new instance of [Source] with mock data
  factory Source.mock() {
    return const Source(
      id: 'cnn',
      name: 'CNN',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      url: 'https://www.cnn.com',
      category: 'general',
    );
  }

  factory Source.fromJson(Map<String, Object?> json) => _$SourceFromJson(json);
}
