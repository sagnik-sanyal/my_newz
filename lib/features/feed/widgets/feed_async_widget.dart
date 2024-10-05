import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../app/constants/assets.dart';
import '../../../core/async_value.dart';
import '../../../core/models/article_model.dart';
import '../../../core/models/paginated_result.dart';
import '../../../shared/extensions/widget_ext.dart';
import '../../../shared/widgets/app_text.dart';
import '../providers/feed_notifier.dart';
import 'feed_item.dart';

@immutable
class FeedAsyncWidget extends StatelessWidget {
  /// Map the loading states to the appropriate asynchronous states
  const FeedAsyncWidget({
    this.skipLoadingOnRefresh = true,
    this.skipLoadingOnData = false,
    super.key,
  });

  final bool skipLoadingOnRefresh;
  final bool skipLoadingOnData;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<PaginatedResult<Article>> state =
        context.select((FeedNotifier s) => s.state);
    if (skipLoadingOnData && state.hasValue) {
      return _dataBuilder(context, state.requireValue);
    }
    return state.maybeWhen(
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      error: _errorBuilder,
      orElse: () => SliverSkeletonizer(
        enabled: state.isLoading,
        ignoreContainers: true,
        child: _dataBuilder(
          context,
          state.maybeWhen(
            data: (PaginatedResult<Article> value) => value,
            orElse: () => PaginatedResult<Article>(
              results: List<Article>.generate(8, (_) => Article.mock()),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the data widget
  Widget _dataBuilder(BuildContext context, PaginatedResult<Article> value) {
    if (value.isEmpty()) return _emptyBuilder(context);
    return SliverMainAxisGroup(
      slivers: <Widget>[
        SliverToBoxAdapter(child: AppText.bold('Top Headlines'))
            .sliverPadding(const EdgeInsets.only(bottom: 20)),
        SliverFixedExtentList.builder(
          itemExtent: 150,
          itemCount: value.results.length,
          itemBuilder: (_, int i) => Padding(
            padding: EdgeInsets.only(bottom: 10, top: i == 0 ? 0 : 10),
            child: Provider<Article>(
              create: (_) => value.results[i],
              child: const FeedItem(),
            ),
          ),
        ),
      ],
    );
  }

  /// When error occurs
  Widget _errorBuilder(Object error, StackTrace? stackTrace) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text(
          'Error: $error',
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  /// Build empty widget
  SliverFillRemaining _emptyBuilder(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            SvgAssets.pageNotFound.path,
            width: (size.width * 0.5).clamp(200, 400),
            height: (size.height * 0.5).clamp(200, 400),
          ),
          AppText.bold(
            "We couldn't find any news :(",
            maxLines: 1,
            fontSize: 18,
          ),
          AppText.regular('Please try again later', maxLines: 1, fontSize: 16),
        ],
      ),
    );
  }
}
