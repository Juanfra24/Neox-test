part of 'favorite_news_bloc.dart';

sealed class FavoriteNewsEvent extends Equatable {
  const FavoriteNewsEvent();

  @override
  List<Object> get props => [];
}

class LoadFavorites extends FavoriteNewsEvent {}

class ToggleFavorite extends FavoriteNewsEvent {
  final NewsArticle article;

  ToggleFavorite(this.article);
}
