import 'package:movie_app/config/api.dart';

class Movie {
  final String title;
  final String poster;
  final double rate;

  Movie({
    required this.title,
    required this.poster,
    required this.rate,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        poster = API_IMAGE_BASE_URL + json['poster_path'],
        rate = double.tryParse(json['vote_average'])!;

  @override
  String toString() {
    return 'Movie: { title: $title, poster: $poster, rate: $rate }';
  }
}
