import 'dart:convert';

import 'package:http/http.dart' as http;

// Fungsi untuk mengubah dari JSON string ke objek ResponseArticles
ResponseArticles responseArticlesFromJson(String str) =>
    ResponseArticles.fromJson(json.decode(str));

// Fungsi untuk mengubah dari objek ResponseArticles ke JSON string
String responseArticlesToJson(ResponseArticles data) =>
    json.encode(data.toJson());

class ResponseArticles {
  final String status;
  final int totalResults;
  final List<Article> articles;

  ResponseArticles({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ResponseArticles.fromJson(Map<String, dynamic> json) =>
      ResponseArticles(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
          json["articles"].map((x) => Article.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? "Tidak ada author",
        title: json["title"] ?? "Tidak ada title",
        description: json["description"] ?? "Tidak ada description",
        url: json["url"] ?? "Tidak ada url",
        urlToImage: json["urlToImage"] ?? "https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg",
        publishedAt: DateTime.parse(json["publishedAt"] ?? "2023-11-20T02:19:48Z"),
        content: json["content"] ?? "Tidak ada content",
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  final String? id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? "Tidak ada id",
        name: json["name"] ?? "Tidak ada name",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
