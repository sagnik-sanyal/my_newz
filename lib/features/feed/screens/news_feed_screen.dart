import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/app_colors.dart';
import '../../../core/async_value.dart';
import '../../../core/models/article_model.dart';
import '../../../core/models/paginated_result.dart';
import '../../../shared/extensions/widget_ext.dart';
import '../../../shared/widgets/app_text.dart';
import '../provider/feed_notifier.dart';
import '../widgets/feed_item.dart';

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
    return ChangeNotifierProvider<FeedNotifier>(
      create: (_) => FeedNotifier()..init(),
      child: SliverToBoxAdapter(
        child: AppText.bold('Top Headlines', fontSize: 14).padding(),
      ),
      builder: (BuildContext context, Widget? child) => Scaffold(
        body: NotificationListener<ScrollEndNotification>(
          onNotification: (ScrollEndNotification details) {
            final double maxExtent = _controller.position.maxScrollExtent;
            final double currentExtent = _controller.position.pixels;
            if (maxExtent - currentExtent > 150) return true;
            // context.read<FeedNotifier>().loadMore();
            log('Load more');
            return true;
          },
          child: CustomScrollView(
            controller: _controller,
            slivers: <Widget>[
              _buildAppbar(),
              child!,
              _buildList().sliverPadding(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the list of feed items
  Selector<FeedNotifier, AsyncValue<PaginatedResult<Article>>> _buildList() {
    return Selector<FeedNotifier, AsyncValue<PaginatedResult<Article>>>(
      selector: (_, FeedNotifier notifier) => notifier.state,
      builder: (_, AsyncValue<PaginatedResult<Article>> state, __) {
        return SliverFixedExtentList.builder(
          itemExtent: 150,
          itemCount: state.valueOrNull?.results.length ?? 0,
          itemBuilder: (_, int i) => Padding(
            padding: EdgeInsets.only(bottom: 10, top: i == 0 ? 0 : 10),
            child: Provider<Article>(
              create: (_) => state.requireValue.results[i],
              child: const FeedItem(),
            ),
          ),
        );
      },
    );
  }

  /// Builds the appbar
  SliverAppBar _buildAppbar() {
    return SliverAppBar(
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false,
      pinned: true,
      title: AppText.bold('MyNews', color: Colors.white, fontSize: 20),
      actions: <Widget>[
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.near_me_rounded, color: Colors.white),
          label: const Text('IN', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
