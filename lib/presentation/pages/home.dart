import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notices_app/data/datasources/news_datasource.dart';
import 'package:notices_app/data/repositories/news_repository_impl.dart';
import 'package:notices_app/domain/usecases/get_usa_latest_articles.dart';
import 'package:notices_app/presentation/blocs/favorite_news/favorite_news_bloc.dart';
import 'package:notices_app/presentation/blocs/news/news_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final newsDatasource = NewsDatasourceImpl();
            final newsRepository = NewsRepositoryImpl(newsDatasource);
            final getUsaLatestArticles = GetUsaLatestArticles(newsRepository);

            return NewsBloc(getUsaLatestArticles);
          },
        ),
        BlocProvider(create: (context) => FavoriteNewsBloc()),
      ],

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Latest Usa News'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsListLoaded) {
              final news = state.news;
              return BlocBuilder<FavoriteNewsBloc, FavoriteNewsState>(
                builder: (context, state) {
                  context.read<FavoriteNewsBloc>().add(LoadFavorites());
                  if (state is FavoriteNewsInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FavoriteNewsLoaded) {
                    final favorites = state.favorites;

                    return ListView.builder(
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        final article = news[index];
                        final isFavorite = favorites.any(
                          (news) => article.title == news.title,
                        );
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: ListTile(
                            title: Text(
                              article.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${article.description} - Released on ${article.publishedAt.year}-${article.publishedAt.month}-${article.publishedAt.day}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : null,
                              ),
                              onPressed: () {
                                context.read<FavoriteNewsBloc>().add(
                                  ToggleFavorite(article),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('Initial state'));
                  }
                },
              );
            } else if (state is NewsListError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('Initial state'));
            }
          },
        ),
      ),
    );
  }
}
