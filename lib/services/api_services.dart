import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newswatch/model/article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();
  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'country': 'us',
      'category': 'technology',
      'apiKey': 'c7bc0c8c26db46d8a0fd1d4ebea360db'
    };
    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) {
      print(Article.fromJson(item).author);
      return Article.fromJson(item);
    }).toList();
    return articles;
  }
}
