import 'package:flutter/material.dart';
import 'package:movie_app/components/category_tile.dart';
import 'package:movie_app/components/genre_tile.dart';
import 'package:movie_app/components/movie_tile.dart';

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
      body: Column(children: const [
        SizedBox(height: 48),
        CategoriesList(),
        SizedBox(height: 48),
        GenresTags(),
        SizedBox(height: 48),
        Content()
      ]),
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({
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
            categoryName: 'In Theater',
            isActive: true,
          ),
          CategoryTile(
            categoryName: 'Box Office',
            isActive: false,
          ),
          CategoryTile(
            categoryName: 'Coming soon',
            isActive: false,
          ),
        ],
      ),
    );
  }
}

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

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          MovieTile(
            imagePath: 'lib/assets/taxi-driver-cover.jpg',
            title: 'Taxi Driver',
            rate: 8.2,
          ),
          MovieTile(
            imagePath:
                'https://img.elo7.com.br/product/original/268A58D/big-poster-filme-pulp-fiction-lo001-tamanho-90x60-cm-presente-geek.jpg',
            title: 'Pulp Fiction',
            rate: 8.9,
          ),
          MovieTile(
            imagePath:
                'https://br.web.img2.acsta.net/medias/nmedia/18/91/08/82/20128877.JPG',
            title: 'Matrix',
            rate: 7.5,
          ),
        ],
      ),
    );
  }
}