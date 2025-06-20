import 'package:dio/dio.dart';
import '../../features/news/data/models/article_model.dart';

class NewsService {
  static const String baseUrl = 'https://api.mediastack.com/v1/news';
  static const String apiKey = '6e24aa21c4da403ac750f5a8bc7b2701';

  final Dio dio = Dio();

  Future<List<ArticleModel>> fetchGeneralNews() async {
    return await fetchNews(
      'sources=cnn,bbc,google-news',
    );
  }

  Future<List<ArticleModel>> searchNews(String category) async {
    return await fetchNews('categories=$category');
  }

  Future<List<ArticleModel>> fetchNews(String request) async {
    try {
      final response = await dio.get('$baseUrl?access_key=$apiKey&$request');

      final data = response.data['data'] as List<dynamic>;

      return data.map((article) => ArticleModel.fromJson(article)).toList();
    } catch (e) {
      return [];
    }
  }
}
