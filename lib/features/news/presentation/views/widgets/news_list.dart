import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_stream/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:news_stream/features/news/presentation/manager/news_cubit/news_state.dart';
import 'package:news_stream/features/news/presentation/views/widgets/news_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../data/models/article_model.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsFailure) {
          return Container(
            color: Colors.grey[200],
            child: const Center(
              child: Text('Enable to fetch News'),
            ),
          );
        }

        List<ArticleModel> articles = [];
        bool showSkeleton = true;

        if (state is NewsLoading) {
          articles = List.generate(5, (index) => ArticleModel.dummy());
        } else if (state is NewsSuccess) {
          articles = state.articles;
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
    );
  }
}
