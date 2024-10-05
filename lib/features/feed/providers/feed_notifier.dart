import '../../../core/async_value.dart';
import '../../../core/models/app_alert_model.dart';
import '../../../core/models/article_model.dart';
import '../../../core/models/country_model.dart';
import '../../../core/models/get_article_payload.dart';
import '../../../core/models/paginated_result.dart';
import '../../../core/providers/state_notifier.dart';
import '../../../core/result.dart';
import '../../../core/services/article_service.dart';
import '../../../core/services/dependency_injection/di.dart';
import '../../../core/services/dio/api_service.dart';

final class FeedNotifier
    extends StateNotifier<AsyncValue<PaginatedResult<Article>>> {
  FeedNotifier(Country country)
      : _country = country,
        super(const AsyncLoading<PaginatedResult<Article>>()) {
    _service = ArticleService(service: getIt.get<ApiService>());
    init();
  }

  /// Instance of [ArticleService] to encapsulate
  late final ArticleService _service;
  Country _country;

  /// Update Country
  void updateCountry(Country value) {
    _country = value;
    init(refresh: true);
    notifyListeners();
  }

  /// Load Feed items for the first time
  Future<void> init({bool refresh = false}) async {
    if (refresh) state = const AsyncLoading<PaginatedResult<Article>>();
    final GetArticlePayload payload = GetArticlePayload(country: _country.code);
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
  Future<void> loadMore() async {
    final PaginatedResult<Article>? prev = state.valueOrNull;
    if (prev == null || !prev.canLoadMore() || state.isLoading) return;
    state = const AsyncLoading<PaginatedResult<Article>>().copyWithPrevious(
      state,
    );
    final Result<PaginatedResult<Article>> result = await _service.getHeadlines(
      GetArticlePayload(country: _country.code, page: prev.nextPage()),
    );
    state = result.when(
      data: (PaginatedResult<Article> data) {
        return AsyncData<PaginatedResult<Article>>(
          prev.copyWith(
            results: <Article>[...prev.results, ...data.results],
          ),
        );
      },
      error: (AppAlert alert) => AsyncError<PaginatedResult<Article>>(
        alert,
        alert.stackTrace ?? StackTrace.current,
      ),
    );
  }
}
