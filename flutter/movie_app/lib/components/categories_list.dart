import 'package:flutter/material.dart';

import '../models/category.dart';

import 'category_tile.dart';

typedef SelectCategoryCallback = Function(Category category);

class CategoriesList extends StatelessWidget {
  final List<Category> categories;
  final Category selectedCategory;
  final SelectCategoryCallback onTap;

  const CategoriesList({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final Category category = categories[index];

          return CategoryTile(
            category: category,
            isActive: category == selectedCategory,
            onTap: () => onTap(category),
            isLast: index == categories.length - 1,
          );
        },
      ),
    );
  }
}
