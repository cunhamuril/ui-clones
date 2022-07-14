import 'package:flutter/material.dart';
import 'package:movie_app/models/genre.dart';

class GenreTile extends StatelessWidget {
  final Genre genre;
  final bool isActive;
  final VoidCallback onTap;

  const GenreTile({
    Key? key,
    required this.genre,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: isActive ? Colors.grey.withOpacity(0.3) : null,
            border: Border.all(
              color: Theme.of(context).dividerColor.withOpacity(0.3),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            genre.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
