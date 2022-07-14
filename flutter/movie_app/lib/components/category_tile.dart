import 'package:flutter/material.dart';
import 'package:movie_app/models/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final bool isActive;
  final VoidCallback onTap;
  final bool isLast;

  const CategoryTile({
    Key? key,
    required this.category,
    required this.isActive,
    required this.onTap,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 32.0, right: isLast ? 32.0 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category.label,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Theme.of(context)
                    .primaryColor
                    .withOpacity(isActive ? 1 : 0.3),
              ),
            ),
            Visibility(
              visible: isActive,
              child: Container(
                height: 6,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.pink[300],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
