import '../../../core/async_value.dart';
import '../../../core/models/app_alert_model.dart';
import '../../../core/models/article_model.dart';
import '../../../core/models/get_article_payload.dart';
import '../../../core/models/paginated_result.dart';
import '../../../core/providers/state_notifier.dart';
import '../../../core/result.dart';
import '../../../core/services/article_service.dart';
import '../../../core/services/dependency_injection/di.dart';
import '../../../core/services/dio/api_service.dart';

final class FeedNotifier
    extends StateNotifier<AsyncValue<PaginatedResult<Article>>> {
  FeedNotifier() : super(const AsyncLoading<PaginatedResult<Article>>()) {
    _service = ArticleService(service: getIt.get<ApiService>());
  }

  /// Instance of [ArticleService] to encapsulate
  late final ArticleService _service;

  String _country = 'us';
  String get country => _country;
  set country(String value) {
    _country = value;
    init();
    notifyListeners();
  }

  /// Load Feed items for the first time
  Future<void> init() async {
    state = const AsyncLoading<PaginatedResult<Article>>();
    final GetArticlePayload payload = GetArticlePayload(country: _country);
    final Result<PaginatedResult<Article>> result =
        await _service.getHeadlines(payload);
    state = result.when(
      data: AsyncData.new,
      error: (AppAlert alert) => AsyncError<PaginatedResult<Article>>(
        alert,
        alert.stackTrace ?? StackTrace.current,
      ),
    );
  }

  /// Load subsequent Feed items on pagination
  Future<void> loadMore({String country = 'in'}) async {
    final PaginatedResult<Article>? prev = state.valueOrNull;
    if (prev == null || state.isLoading) return;
  }
}
