import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/assets.dart';
import '../../../app/constants/ui_constants.dart';
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
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(child: _buildContent(article)),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: _buildImage(article),
          ),
        ],
      ),
    );
  }

  /// Builds the content
  Column _buildContent(Article article) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <AppText>[
        AppText.bold(
          article.source.name ?? 'Trending',
          fontSize: 14,
          maxLines: 1,
        ),
        AppText.regular(
          article.description ?? 'Title',
          maxLines: 4,
          fontSize: 12,
        ),
        if (article.publishedAt != null)
          AppText.regular(
            article.timeAgo,
            fontSize: 10,
            maxLines: 1,
            color: AppColors.grey,
          ),
      ],
    );
  }

  /// Builds the image
  Widget _buildImage(Article article) {
    final Image image = Image.asset(
      ImageAssets.breakingNews.path,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
    if (article.urlToImage?.isEmpty ?? true) return image;
    return CachedNetworkImage(
      imageUrl: article.urlToImage ?? '',
      errorWidget: (_, __, ___) => image,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
