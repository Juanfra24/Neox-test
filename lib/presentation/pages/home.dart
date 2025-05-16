import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notices_app/data/datasources/news_datasource.dart';
import 'package:notices_app/data/repositories/news_repository_impl.dart';
import 'package:notices_app/domain/usecases/get_chile_latest_articles.dart';
import 'package:notices_app/presentation/blocs/news/news_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final newsDatasource = NewsDatasourceImpl();
        final newsRepository = NewsRepositoryImpl(newsDatasource);
        final getChileLatestArticles = GetChileLatestArticles(newsRepository);

        return NewsBloc(getChileLatestArticles);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Latest Chile News'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsListLoaded) {
              final news = state.news;
              return ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  final article = news[index];
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
                      trailing: const Icon(Icons.favorite_border),
                    ),
                  );
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
