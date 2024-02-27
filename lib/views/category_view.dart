import 'package:flutter/material.dart';
import '../widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [NewsListViewBuilder(category: category)],
        ),
      ),
    );
  }
}
