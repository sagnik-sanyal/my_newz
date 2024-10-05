import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/article_model.dart';
import '../../../shared/widgets/app_text.dart';

@immutable
class FeedItem extends StatelessWidget {
  /// Creates [FeedItem] instance with [key]
  const FeedItem({super.key});

  @override
  Widget build(BuildContext context) {
    final Article article = Provider.of<Article>(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText.medium('Title', fontSize: 20),
                AppText.regular('Description'),
              ],
            ),
          ),
          const Placeholder(
            fallbackHeight: 100,
            fallbackWidth: 100,
          ),
        ],
      ),
    );
  }
}
