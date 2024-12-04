import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/models/news_responcse/news_responcse.dart';
import 'package:news/models/sources_response/sources_response.dart';

class APIService {
  static Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(APIConstants.baseURL, APIConstants.sourceEndpoint, {
      'apiKey': APIConstants.apiKey,
      'category': categoryId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponcse> getNews(String sourceId) async {
    final uri = Uri.https(APIConstants.baseURL, APIConstants.newsEndpoint,{
      'apiKey': APIConstants.apiKey,
      'sources': sourceId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponcse.fromJson(json);
  }

  static Future<NewsResponcse> searchNews({required String query, required String category }) async {
    final uri = Uri.https(APIConstants.baseURL, APIConstants.searchEndpoint, {    
      'apiKey': APIConstants.apiKey,                                                                                                                
      'q': query,            
      'category': category,           

    });   
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponcse.fromJson(json);
  }     
}
