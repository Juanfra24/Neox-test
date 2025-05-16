part of 'favorite_news_bloc.dart';

sealed class FavoriteNewsState extends Equatable {
  const FavoriteNewsState();

  @override
  List<Object> get props => [];
}

class FavoriteNewsInitial extends FavoriteNewsState {}

class FavoriteNewsLoaded extends FavoriteNewsState {
  final List<NewsArticle> favorites;

  const FavoriteNewsLoaded(this.favorites);
}
