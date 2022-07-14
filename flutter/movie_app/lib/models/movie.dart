import 'package:movie_app/config/api.dart';

class Movie {
  final String title;
  final String? poster;
  final num rate;

  Movie({
    required this.title,
    required this.poster,
    required this.rate,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        poster = json['poster_path'] != null
            ? API_IMAGE_BASE_URL + json['poster_path']
            : null,
        rate = json['vote_average'] ?? 1.1;

  @override
  String toString() {
    return 'Movie: { title: $title, poster: $poster, rate: $rate }';
  }
}
