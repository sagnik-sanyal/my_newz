import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/app_colors.dart';
import '../../../shared/extensions/widget_ext.dart';
import '../../../shared/widgets/app_text.dart';
import '../provider/feed_notifier.dart';
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
    return ChangeNotifierProvider<FeedNotifier>(
      create: (_) => FeedNotifier()..init(),
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
              const FeedAsyncWidget(skipLoadingOnData: true).sliverPadding(),
            ],
          ),
        ),
      ),
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
