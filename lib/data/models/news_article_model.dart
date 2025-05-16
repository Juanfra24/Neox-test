import 'package:notices_app/data/models/news_source_model.dart';
import 'package:notices_app/domain/entities/news_article.dart';

class NewsArticleModel extends NewsArticle {
  const NewsArticleModel({
    required super.source,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  static List<NewsArticleModel> fromJsonList(List<dynamic> list) {
    return list.map((json) => NewsArticleModel.fromJson(json)).toList();
  }

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      source: SourceModel.fromJson(json['source']),
      author: json['author'] ?? 'Unknown',
      title: json['title'] ?? 'Unknown',
      description: json['description'] ?? 'Unknown',
      url: json['url'] ?? 'Unknown',
      urlToImage: json['urlToImage'] ?? 'Unknown',
      publishedAt: DateTime.parse(json['publishedAt']),
      content: json['content'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': (source as SourceModel).toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt.toIso8601String(),
      'content': content,
    };
  }
}
