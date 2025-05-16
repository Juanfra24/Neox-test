import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notices_app/domain/entities/news_article.dart';
import 'package:notices_app/domain/usecases/get_usa_latest_articles.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetUsaLatestArticles _usaLatestArticles;

  NewsBloc(this._usaLatestArticles) : super(NewsListInitial()) {
    on<GetLatestUsaNews>((event, emit) async {
      emit(NewsListLoading());
      try {
        final news = await _usaLatestArticles();
        emit(NewsListLoaded(news: news));
      } catch (e) {
        emit(NewsListError(message: 'Failed to fetch news: $e'));
      }
    });

    add(GetLatestUsaNews());
  }
}
