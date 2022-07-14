import 'package:flutter/cupertino.dart';

import 'genre_tile.dart';

class GenresTags extends StatelessWidget {
  const GenresTags({
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
