import 'dart:io';
import 'package:dio/dio.dart';
import 'package:notices_app/data/datasources/news_datasource.dart';
import 'package:notices_app/data/models/news_article_model.dart';
import 'package:notices_app/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  NewsRepositoryImpl(this.dataSource);
  final NewsDatasource dataSource;
  @override
  Future<List<NewsArticleModel>> getLatestNews() async {
    try {
      final result = await dataSource.getLatestNews();

      final List<dynamic> newsList = result['articles'];
      if (newsList.isEmpty) {
        throw Exception('No news articles found');
      }

      return NewsArticleModel.fromJsonList(newsList);
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout) {
          throw Exception('Connection timeout');
        } else if (e.type == DioExceptionType.receiveTimeout) {
          throw Exception('Receive timeout');
        } else if (e.type == DioExceptionType.badResponse) {
          throw Exception('Server error: ${e.response?.statusCode}');
        } else if (e.type == DioExceptionType.cancel) {
          throw Exception('Request cancelled');
        } else {
          throw Exception('Unexpected error: $e');
        }
      } else if (e is SocketException) {
        throw Exception('No internet connection');
      } else {
        throw Exception('Unexpected error: $e');
      }
    }
  }
}
