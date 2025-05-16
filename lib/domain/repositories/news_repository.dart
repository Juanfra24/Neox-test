import 'package:notices_app/data/models/news_article_model.dart';

abstract class NewsRepository {
  Future<List<NewsArticleModel>> getLatestNews();
}
