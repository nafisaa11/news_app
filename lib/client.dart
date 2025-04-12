import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/response_articles.dart';

class Client {
  static Future<List<Article>> fetchArticle() async {
    const url ="https://newsapi.org/v2/everything?q=tesla&from=2025-03-11&sortBy=publishedAt&apiKey=823672871b2d493282bb6bf0aa8ccffa";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      ResponseArticles responseArticles = ResponseArticles.fromJson(responseBody);
      return responseArticles.articles;
    }else {
      throw Exception('Failed to load articles');
    }
  }
  
}