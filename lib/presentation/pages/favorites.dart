import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notices_app/presentation/blocs/favorite_news/favorite_news_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return FavoriteNewsBloc();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Favorite News'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: BlocBuilder<FavoriteNewsBloc, FavoriteNewsState>(
          builder: (context, state) {
            context.read<FavoriteNewsBloc>().add(LoadFavorites());
            if (state is FavoriteNewsInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoriteNewsLoaded) {
              final news = state.favorites;
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
            } else {
              return const Center(child: Text('Initial state'));
            }
          },
        ),
      ),
    );
  }
}
