import 'package:flutter/material.dart';
import 'package:movie_app/components/category_tile.dart';
import 'package:movie_app/components/genre_tile.dart';
import 'package:movie_app/components/movie_tile.dart';
import 'package:movie_app/http/clients/movie_client.dart';
import 'package:movie_app/models/movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.all(32.0),
          child: Icon(Icons.menu),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(height: 48),
        const _CategoriesList(),
        const SizedBox(height: 48),
        const _GenresTags(),
        const SizedBox(height: 48),
        _Content()
      ]),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryTile(
            categoryName: 'Upcoming',
            isActive: true,
          ),
          CategoryTile(
            categoryName: 'Box Office',
            isActive: false,
          ),
          CategoryTile(
            categoryName: 'In Theater',
            isActive: false,
          ),
        ],
      ),
    );
  }
}

class _GenresTags extends StatelessWidget {
  const _GenresTags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 32),
        children: const [
          GenreTile(genreName: 'Action'),
          GenreTile(genreName: 'Crime'),
          GenreTile(genreName: 'Comedy'),
          GenreTile(genreName: 'Drama'),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final MovieClient movieClient = MovieClient();

  _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Movie>>(
        future: movieClient.findUpcomingMovies(),
        builder: (context, snapshot) {
          final List<Movie> movies = snapshot.data ?? [];

          if (!snapshot.hasData) {
            return const Text('Unknown error');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final Movie movie = movies[index];

                return MovieTile(
                  movie: Movie(
                    title: movie.title,
                    poster: movie.poster,
                    rate: movie.rate,
                  ),
                );
              },
            );
          }

          return const Text('Unknown error');
        },
      ),
    );
  }
}
