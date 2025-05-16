import 'package:notices_app/domain/entities/news_article.dart';
import 'package:notices_app/domain/repositories/news_repository.dart';

class GetUsaLatestArticles {
  GetUsaLatestArticles(this._repository);
  final NewsRepository _repository;

  Future<List<NewsArticle>> call() async {
    return await _repository.getLatestNews();
  }
}
