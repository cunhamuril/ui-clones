import 'package:flutter/material.dart';
import 'package:movie_app/components/categories_list.dart';
import 'package:movie_app/components/genres_tags.dart';
import 'package:movie_app/components/movies_list.dart';
import 'package:movie_app/models/category.dart';

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

  String selectedCategory = categories[0].value;

  _handleSelectCategory(String categoryValue) {
    setState(() {
      selectedCategory = categoryValue;
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
        const GenresTags(),
        const SizedBox(height: 48),
        MoviesList(category: selectedCategory)
      ]),
    );
  }
}
