import 'package:flutter/material.dart';
import 'package:news/models/source_model.dart';
import 'package:news/news/news_list.dart';
import 'package:news/sources/sources_tabs.dart';

class NewsTab extends StatefulWidget {
NewsTab(this.categoryId, {super.key});

String categoryId;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {

  List<SourceModel> sources = List.generate(10, (index) => SourceModel(id: '$index', name: 'Source $index'));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SourcesTabs(sources),
        const Expanded(child: NewsList())
      ],
    );
  }
}