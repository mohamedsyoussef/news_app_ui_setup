import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/tools/constants.dart';

class NewsService {
  final Dio dio;

  NewsService({required this.dio});
  Future<List<ArticleModel>> getTopHeadLines({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey&category=$category');
      print(response);
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
            image: article['urlToImage'],
            title: article['title'],
            subTitle: article['description']);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
