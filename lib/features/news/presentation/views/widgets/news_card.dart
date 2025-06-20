import 'package:flutter/material.dart';
import 'package:news_stream/features/news/presentation/views/widgets/news_actions.dart';
import 'package:news_stream/features/news/presentation/views/widgets/news_image.dart';
import '../../../data/models/article_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NewsImage(articleModel: articleModel),
        const SizedBox(height: 12),
        Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          articleModel.subtitle ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                articleModel.source ?? '',
                maxLines: 1,
                style: const TextStyle(color: Colors.orange, fontSize: 14.5),
              ),
            ),
            NewsActions(newsUrl: articleModel.url ?? ''),
          ],
        ),
      ],
    );
  }
}
