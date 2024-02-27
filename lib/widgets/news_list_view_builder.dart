import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';
import '../services/news_service.dart';

class NewsListViewBuilder extends StatefulWidget {
  final String category;
  const NewsListViewBuilder({super.key, required this.category});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  final Dio dio = Dio();
  late Future<List<ArticleModel>> future;

  @override
  void initState() {
    super.initState();
    future = NewsService(dio: dio).getTopHeadLines(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder:
          (BuildContext context, AsyncSnapshot<List<ArticleModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Oops, there was a problem ${snapshot.error.toString()}',
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else {
          // Handle other cases or loading states if needed
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('No data available.'),
            ),
          );
        }
      },
    );
  }
}
