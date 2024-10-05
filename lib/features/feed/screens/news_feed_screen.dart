import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/app_colors.dart';
import '../../../core/async_value.dart';
import '../../../core/models/article_model.dart';
import '../../../core/models/country_model.dart';
import '../../../core/models/paginated_result.dart';
import '../../../shared/extensions/widget_ext.dart';
import '../../../shared/widgets/app_text.dart';
import '../providers/country_notifier.dart';
import '../providers/feed_notifier.dart';
import '../widgets/country_selector.dart';
import '../widgets/feed_async_widget.dart';

@immutable
class NewsFeedScreen extends StatefulWidget {
  /// Creates [NewsFeedScreen] instance
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<CountryNotifier, FeedNotifier>(
      create: (_) => FeedNotifier(context.read<CountryNotifier>().state),
      update: (_, CountryNotifier country, FeedNotifier? feed) {
        return feed!..updateCountry(country.state);
      },
      builder: (BuildContext context, Widget? child) => Scaffold(
        body: NotificationListener<ScrollEndNotification>(
          onNotification: (ScrollEndNotification details) {
            final double maxExtent = _controller.position.maxScrollExtent;
            final double currentExtent = _controller.position.pixels;
            if (maxExtent - currentExtent > 150) return true;
            context.read<FeedNotifier>().loadMore();
            return true;
          },
          child: CustomScrollView(
            controller: _controller,
            slivers: <Widget>[
              _buildAppbar(context),
              const FeedAsyncWidget(skipLoadingOnData: true).sliverPadding(),
              _buildLoader(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the appbar
  SliverAppBar _buildAppbar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false,
      pinned: true,
      title: AppText.bold('MyNews', color: Colors.white, fontSize: 20),
      actions: <TextButton>[
        TextButton.icon(
          onPressed: _showPicker,
          icon: const Icon(Icons.near_me_rounded, color: Colors.white),
          label: Selector<CountryNotifier, Country>(
            selector: (_, CountryNotifier notifier) => notifier.state,
            builder: (_, Country state, __) => AppText.medium(
              state.code.toUpperCase(),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  /// Show countries picker
  void _showPicker() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      constraints: const BoxConstraints(maxHeight: 300),
      builder: (_) => const CountrySelector(),
    );
  }

  /// Pagination loader
  Selector<FeedNotifier, AsyncValue<PaginatedResult<Article>>> _buildLoader() {
    return Selector<FeedNotifier, AsyncValue<PaginatedResult<Article>>>(
      selector: (_, FeedNotifier s) => s.state,
      child: const SliverToBoxAdapter(),
      builder: (_, AsyncValue<PaginatedResult<Article>> state, Widget? child) {
        final bool hasValue = state.hasValue;
        final bool isLoading = state.isLoading;
        if (hasValue && isLoading && !state.requireValue.isEmpty()) {
          return SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox.square(
                  dimension: 20,
                  child: CircularProgressIndicator(),
                ),
                const SizedBox(width: 10),
                Flexible(child: AppText.medium('Loading more...')),
              ],
            ),
          );
        } else if (hasValue &&
            !state.requireValue.isEmpty() &&
            !state.requireValue.canLoadMore()) {
          return SliverToBoxAdapter(
            child: Center(
              child: AppText.medium('No more articles to load'),
            ),
          );
        }
        return child!;
      },
    );
  }
}
