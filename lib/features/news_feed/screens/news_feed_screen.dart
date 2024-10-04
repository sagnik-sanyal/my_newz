import 'package:flutter/material.dart';

import '../../../app/constants/app_colors.dart';
import '../../../shared/extensions/widget_ext.dart';
import '../../../shared/widgets/app_text.dart';
import '../widgets/feed_item.dart';

@immutable
class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppbar(),
          SliverToBoxAdapter(
            child: AppText.medium('Top Headlines', fontSize: 18).padding(),
          ),
          SliverFixedExtentList.builder(
            itemExtent: 140,
            itemBuilder: (_, int index) => Padding(
              padding: EdgeInsets.only(bottom: 10, top: index != 0 ? 10 : 0),
              child: const FeedItem(),
            ),
          ).sliverPadding(),
        ],
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
