import 'package:flutter/material.dart';
import '../../../../../core/utils/news_service.dart';
import '../../../data/models/article_model.dart';
import 'search_news_bar.dart';

class SearchNewsListViewBuilder extends StatefulWidget {
  const SearchNewsListViewBuilder({super.key, required this.category});

  final String category;

  @override
  State<SearchNewsListViewBuilder> createState() =>
      _SearchNewsListViewBuilderState();
}

class _SearchNewsListViewBuilderState extends State<SearchNewsListViewBuilder> {
  Future<List<ArticleModel>>? future;
  @override
  void initState() {
    super.initState();
    future = NewsService().searchNews(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SearchNewsListView(
            category: widget.category,
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const Text('oops there was an error,try again');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
