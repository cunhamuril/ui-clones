import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_tile.dart';
import 'package:movie_app/http/clients/movie_client.dart';
import 'package:movie_app/models/movie.dart';

class MoviesList extends StatelessWidget {
  final MovieClient movieClient = MovieClient();

  final String category;

  MoviesList({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Movie>>(
        future: movieClient.findMovies(category),
        builder: (context, snapshot) {
          final List<Movie> movies = snapshot.data ?? [];

          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: CircularProgressIndicator(),
            );
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
