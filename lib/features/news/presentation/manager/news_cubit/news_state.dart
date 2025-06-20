import 'package:news_stream/features/news/data/models/article_model.dart';

abstract class NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<ArticleModel> articles;
  NewsSuccess({required this.articles});
}

class NewsFailure extends NewsState {}
