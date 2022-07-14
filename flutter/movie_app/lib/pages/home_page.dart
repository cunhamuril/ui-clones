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

  // Get from TMDB API
  static final List<Genre> genres = [
    Genre(id: 0, name: 'Todos'),
    Genre(id: 28, name: "Ação"),
    Genre(id: 12, name: "Aventura"),
    Genre(id: 16, name: "Animação"),
    Genre(id: 35, name: "Comédia"),
    Genre(id: 80, name: "Crime"),
    Genre(id: 99, name: "Documentário"),
    Genre(id: 18, name: "Drama"),
    Genre(id: 10751, name: "Família"),
    Genre(id: 14, name: "Fantasia"),
    Genre(id: 36, name: "História"),
    Genre(id: 27, name: "Terror"),
    Genre(id: 10402, name: "Música"),
    Genre(id: 9648, name: "Mistério"),
    Genre(id: 10749, name: "Romance"),
    Genre(id: 878, name: "Ficção científica"),
    Genre(id: 10770, name: "Cinema TV"),
    Genre(id: 53, name: "Thriller"),
    Genre(id: 10752, name: "Guerra"),
    Genre(id: 37, name: "Faroeste")
  ];

  Category selectedCategory = categories[0];
  Genre selectedGenre = genres[0];

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
      body: Column(
        children: [
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
            genres: genres,
          ),
          const SizedBox(height: 48),
          MoviesList(
            category: selectedCategory,
            genre: selectedGenre,
          )
        ],
      ),
    );
  }
}
