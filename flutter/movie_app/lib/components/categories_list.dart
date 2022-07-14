import 'package:flutter/material.dart';

import '../models/category.dart';

import 'category_tile.dart';

typedef SelectCategoryCallback = Function(String categoryValue);

class CategoriesList extends StatefulWidget {
  final List<Category> categories;
  final String selectedCategory;
  final SelectCategoryCallback onTap;

  const CategoriesList({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CategoriesList> createState() => CategoriesListState();
}

class CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: widget.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final Category category = widget.categories[index];

          return CategoryTile(
            category: category,
            isActive: category.value == widget.selectedCategory,
            onTap: () => widget.onTap(category.value),
          );
        },
      ),
    );
  }
}
