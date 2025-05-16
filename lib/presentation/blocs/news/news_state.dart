part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsListInitial extends NewsState {}

class NewsListLoading extends NewsState {}

class NewsListLoaded extends NewsState {
  final List<NewsArticle> news;

  const NewsListLoaded({required this.news});

  @override
  List<Object> get props => [news];
}

class NewsListError extends NewsState {
  final String message;

  const NewsListError({required this.message});

  @override
  List<Object> get props => [message];
}
