import 'package:flutter/material.dart';
import '../../../data/models/article_model.dart';
import '../web_view_bars.dart';
import 'news_card.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;
  const NewsListView({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewScreen(
                    url: articles[index].urlwebs!,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: NewsCard(
                articleModel: articles[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
