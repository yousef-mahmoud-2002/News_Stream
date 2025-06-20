import 'package:flutter/material.dart';
import 'package:news_stream/core/utils/app_title.dart';
import 'package:news_stream/features/news/presentation/views/widgets/category_search_bar.dart';
import 'widgets/news_list.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const AppTitle(),
        backgroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CategorySearchBar(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Text(
                'Top Headlines',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverFillRemaining(child: NewsList()),
          ],
        ),
      ),
    );
  }
}
