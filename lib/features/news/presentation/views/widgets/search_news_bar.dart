import 'package:flutter/material.dart';
import '../../../data/models/article_model.dart';
import '../web_view_bars.dart';
import 'news_card.dart';

class SearchNewsListView extends StatelessWidget {
  const SearchNewsListView(
      {super.key, required this.articles, required this.category});

  final String category;
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.orange,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          category,
          style: const TextStyle(color: Colors.orange),
        ),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
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
