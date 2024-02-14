import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/tools/constants.dart';

class NewsService {
  final Dio dio;

  NewsService({required this.dio});
  Future<List<ArticleModel>> getNews() async {
    CategoryModel? categoryModel;
    Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=71d5db1185d94b9a92262cbd51625562');
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
  }
}
