import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

import '../services/news_service.dart';
import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  List<ArticleModel>? articles;
  @override
  void initState() async {
    super.initState();
    articles = await NewsService(dio: Dio()).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return FutureBuilder<List<ArticleModel>>(
    //   future: articles,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return NewsListView(
    //         articles: snapshot.data!,
    //       );
    //     } else if (snapshot.hasError) {
    //       return const SliverToBoxAdapter(
    //         child: Text('oops  was an error, try later'),
    //       );
    //     } else {
    //       return const SliverToBoxAdapter(
    //         child: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
