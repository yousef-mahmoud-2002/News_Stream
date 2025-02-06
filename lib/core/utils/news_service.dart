import 'package:dio/dio.dart';
import '../../features/news/data/models/article_model.dart';

class NewsService {
  String baseUrl = 'https://api.mediastack.com/v1/news';
  String apiKey = '8d57aa9a4a29ba965f798a3c4ea1c01d';

  Future<List<ArticleModel>> getGeneralNews() async {
    return await parse('sources=cnn,bbc');
  }

  Future<List<ArticleModel>> searchNews(String category) async {
    return await parse('categories=$category');
  }

  Future<List<ArticleModel>> parse(String request) async {
    try {
      Response response =
          await Dio().get('$baseUrl?access_key=$apiKey&$request');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['data'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['image'],
          title: article['title'],
          subtitle: article['description'],
          urlwebs: article['url'],
        );
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
