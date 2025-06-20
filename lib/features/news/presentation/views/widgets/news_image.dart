import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_stream/features/news/data/models/article_model.dart';
import 'package:shimmer/shimmer.dart';

class NewsImage extends StatelessWidget {
  const NewsImage({super.key, required this.articleModel});

  final String defaultImage = 'https://rb.gy/wtar0n';
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: articleModel.image ?? defaultImage,
          placeholder: (context, url) {
            return placeholder();
          },
          errorWidget: (context, url, error) {
            return errorImage();
          },
        ),
      ),
    );
  }

  Widget placeholder() {
    return Shimmer.fromColors(
      baseColor: Colors.transparent,
      highlightColor: Colors.orange.withValues(alpha: 0.3),
      child: Container(
        color: Colors.grey[200],
        width: double.infinity,
      ),
    );
  }

  Widget errorImage() {
    return Container(
      width: double.infinity,
      color: Colors.grey[300],
      child: const Icon(Icons.broken_image, size: 48, color: Colors.grey),
    );
  }
}
