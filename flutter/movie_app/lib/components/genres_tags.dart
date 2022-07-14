import 'package:flutter/material.dart';
import 'package:movie_app/http/clients/genre_client.dart';
import 'package:movie_app/models/genre.dart';

import 'genre_tile.dart';

class GenresTags extends StatelessWidget {
  final GenreClient genreClient = GenreClient();

  GenresTags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Genre>>(
      future: genreClient.findAllGenres(),
      builder: ((context, snapshot) {
        final List<Genre> genres = snapshot.data ?? [];

        genres.insert(0, Genre(id: 0, name: "Todos"));

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
          return SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 32),
              itemCount: genres.length,
              itemBuilder: (context, index) {
                final Genre genre = genres[index];

                return GenreTile(
                  genre: Genre(id: genre.id, name: genre.name),
                );
              },
            ),
          );
        }

        return const Text('Unknown error');
      }),
    );
  }
}
