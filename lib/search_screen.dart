import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/app_theme.dart';
import 'package:news/news/news_item.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({required this.categoryId , super.key});

  final String categoryId;

  @override
  State<SearchScreen> createState() => _SearchScreenState();

}

class _SearchScreenState extends State<SearchScreen> {
String query = '';
@override
  

  @override
  Widget build(BuildContext context) {
    return Container(decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: const SizedBox(),
          actions: [
            const BackButton(),
            Expanded(
              child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SearchBar(
                onSubmitted: (value) => setState(() => query = value),
              
              ),
                      ),
            ),
            const SizedBox(width: 12,)
          ],
        ),
        body: Builder(builder: (context) {
          if (query == '') {
            return const Center(child: Text('Search for news'));
          } else {
            return FutureBuilder(
                future: APIService.searchNews(query: query, category: widget.categoryId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingIndicator();
                  } else if (snapshot.hasError || snapshot.data!.status != 'ok') {
                    return const ErrorIndicator();
                  } else {
                    final newsList = snapshot.data!.news ?? [];
                    return ListView.builder(
                        itemCount: newsList.length,
                        itemBuilder: (context, index) => NewsItem(newsList[index]));
                  }
                });
          }
        }
        )
      ),
    );
  }
}

