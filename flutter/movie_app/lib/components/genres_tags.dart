import 'package:flutter/material.dart';
import 'package:movie_app/models/genre.dart';

import 'genre_tile.dart';

typedef SelectGenreCallback = Function(Genre genre);

class GenresTags extends StatelessWidget {
  final List<Genre> genres;
  final Genre selectedGenre;
  final SelectGenreCallback onTap;

  const GenresTags({
    Key? key,
    required this.selectedGenre,
    required this.onTap,
    required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            isActive: selectedGenre == genre,
            onTap: () => onTap(genre),
          );
        },
      ),
    );
  }
}
