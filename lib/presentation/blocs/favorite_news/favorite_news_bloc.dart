import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notices_app/data/models/news_article_model.dart';
import 'package:notices_app/domain/entities/news_article.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_news_event.dart';
part 'favorite_news_state.dart';

class FavoriteNewsBloc extends Bloc<FavoriteNewsEvent, FavoriteNewsState> {
  FavoriteNewsBloc() : super(FavoriteNewsInitial()) {
    on<ToggleFavorite>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final currentState = state;

      if (currentState is FavoriteNewsLoaded) {
        final isAlreadyFavorite = currentState.favorites.any(
          (a) => a.title == event.article.title,
        );
        final updatedList =
            isAlreadyFavorite
                ? currentState.favorites
                    .where((a) => a.title != event.article.title)
                    .toList()
                : [...currentState.favorites, event.article];

        await prefs.setString(
          'favorite_articles',
          updatedList.map((a) => (a as NewsArticleModel).toJson()).toString(),
        );
        emit(FavoriteNewsLoaded(updatedList));
      }
    });

    on<LoadFavorites>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString('favorite_articles');
      final articles =
          data != null
              ? (json.decode(data) as List)
                  .map((item) => NewsArticleModel.fromJson(item))
                  .toList()
              : <NewsArticle>[];
      emit(FavoriteNewsLoaded(articles));
    });
  }
}
