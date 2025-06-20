import 'package:flutter/material.dart';
import 'package:news_stream/features/news/data/models/article_model.dart';
import 'package:news_stream/features/news/presentation/views/widgets/news_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/news_service.dart';

class SearchNewsView extends StatefulWidget {
  const SearchNewsView({super.key, required this.category});

  final String category;

  @override
  State<SearchNewsView> createState() => _SearchNewsViewState();
}

class _SearchNewsViewState extends State<SearchNewsView> {
  Future<List<ArticleModel>>? future;
  @override
  void initState() {
    super.initState();
    future = NewsService().searchNews(widget.category)
        as Future<List<ArticleModel>>?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.orange,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.category),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder<List<ArticleModel>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                color: Colors.grey[200],
                child: const Center(
                  child: Text('Enable to fetch News'),
                ),
              );
            }

            List<ArticleModel> articles = [];
            bool showSkeleton = true;

            if (snapshot.connectionState == ConnectionState.waiting) {
              articles = List.generate(5, (index) => ArticleModel.dummy());
            } else if (snapshot.hasData) {
              articles = snapshot.data!;
              showSkeleton = false;
            }

            return Skeletonizer(
              enabled: showSkeleton,
              child: ListView.separated(
                itemCount: articles.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 16),
                itemBuilder: (BuildContext context, int index) {
                  return NewsCard(
                    articleModel: articles[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
              ),
            );
          },
        ),
      ),
    );
  }
}
