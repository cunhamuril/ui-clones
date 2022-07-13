import 'package:flutter/material.dart';
import 'package:movie_app/components/category_tile.dart';
import 'package:movie_app/components/genre_tile.dart';
import 'package:movie_app/components/movie_tile.dart';
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
        const SizedBox(height: 72),
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
            categoryName: 'Coming soon',
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
  final List<Movie> movies = [];

  _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movies.add(
      Movie(
        poster:
            'https://http2.mlstatic.com/D_NQ_NP_971060-MLB26550280154_122017-O.jpg',
        title: 'Taxi Driver',
        rate: 8.2,
      ),
    );
    movies.add(
      Movie(
        poster:
            'https://img.elo7.com.br/product/original/268A58D/big-poster-filme-pulp-fiction-lo001-tamanho-90x60-cm-presente-geek.jpg',
        title: 'Pulp Fiction',
        rate: 8.9,
      ),
    );
    movies.add(
      Movie(
        poster:
            'https://br.web.img2.acsta.net/medias/nmedia/18/91/08/82/20128877.JPG',
        title: 'Matrix',
        rate: 7.5,
      ),
    );
    movies.add(
      Movie(
        poster:
            'https://i.pinimg.com/originals/2a/d3/b5/2ad3b5c9c290fabca92f11fbf52594e4.jpg',
        title: 'Se7ven',
        rate: 7.5,
      ),
    );

    return Expanded(
      child: ListView.builder(
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
      ),
    );
  }
}
