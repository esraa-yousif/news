import 'news.dart';

class NewsResponcse {
  final String? status;
  final int? totalResults;
  final List<News>? news;

  const NewsResponcse({this.status, this.totalResults, this.news});

  factory NewsResponcse.fromJson(Map<String, dynamic> json) => NewsResponcse(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        news: (json['articles'] as List<dynamic>?)
            ?.map((e) => News.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
