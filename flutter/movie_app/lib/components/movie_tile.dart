import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.network(
              movie.poster,
              width: 210,
              height: 310,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Text(
                movie.title,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_rate,
                    color: Colors.amber[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    movie.rate.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
