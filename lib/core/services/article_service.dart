import '../../app/typedefs/typedefs.dart';
import '../models/article_model.dart';
import '../models/get_article_payload.dart';
import '../models/paginated_result.dart';
import '../result.dart';
import 'dio/api_service.dart';

class ArticleService {
  /// Create a new instance of [ArticleService] that uses [ApiService]
  /// and is responsible for fetching articles
  const ArticleService({required ApiService service}) : _service = service;

  final ApiService _service;

  /// Get headlines
  FutureResult<PaginatedResult<Article>> getHeadlines(
    GetArticlePayload payload,
  ) async {
    final Result<JSON> response =
        await _service.get('top-headlines', queryParams: payload.toJson());
    return response.when(
      data: (JSON data) => Result.guard(
        () => PaginatedResult<Article>.fromJson(data, Article.fromJson),
      ),
      error: Result.error,
    );
  }
}
