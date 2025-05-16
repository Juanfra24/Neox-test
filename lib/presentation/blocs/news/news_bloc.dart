import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notices_app/domain/entities/news_article.dart';
import 'package:notices_app/domain/usecases/get_chile_latest_articles.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetChileLatestArticles _chileLatestArticles;

  NewsBloc(this._chileLatestArticles) : super(NewsListInitial()) {
    on<GetLatestChileNews>((event, emit) async {
      emit(NewsListLoading());
      try {
        final news = await _chileLatestArticles();
        emit(NewsListLoaded(news: news));
      } catch (e) {
        emit(NewsListError(message: 'Failed to fetch news: $e'));
      }
    });

    add(GetLatestChileNews());
  }
}
