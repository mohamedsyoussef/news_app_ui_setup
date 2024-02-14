import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import '../services/news_service.dart';
import 'news_tile.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  List<ArticleModel>? articles = [];

  @override
  void initState() {
    super.initState();
    getNewsNow();
  }

  Future<void> getNewsNow() async {
    articles = await NewsService(dio: Dio()).getNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles?.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTile(
              articleModel: articles![index],
            ),
          );
        },
      ),
    );
  }
}
