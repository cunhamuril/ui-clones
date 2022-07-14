import 'package:flutter/material.dart';
import 'package:movie_app/components/categories_list.dart';
import 'package:movie_app/components/genres_tags.dart';
import 'package:movie_app/components/movies_list.dart';
import 'package:movie_app/models/category.dart';
import 'package:movie_app/models/genre.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<Category> categories = [
    Category(value: 'upcoming', label: 'Em breve'),
    Category(value: 'popular', label: 'Populares'),
    Category(value: 'now_playing', label: 'Em cartaz'),
    Category(value: 'top_rated', label: 'Melhores avaliados'),
  ];

  Category selectedCategory = categories[0];
  Genre selectedGenre = Genre(id: 0, name: 'Todos');

  _handleSelectCategory(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }

  _handleSelectGenre(Genre genre) {
    setState(() {
      selectedGenre = genre;
    });
  }

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
        CategoriesList(
          categories: categories,
          selectedCategory: selectedCategory,
          onTap: _handleSelectCategory,
        ),
        const SizedBox(height: 48),
        GenresTags(
          selectedGenre: selectedGenre,
          onTap: _handleSelectGenre,
        ),
        const SizedBox(height: 48),
        MoviesList(
          category: selectedCategory,
          genre: selectedGenre,
        )
      ]),
    );
  }
}
