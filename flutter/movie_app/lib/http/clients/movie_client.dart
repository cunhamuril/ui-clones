import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/config/api.dart';
import 'package:movie_app/http/client.dart';
import 'package:movie_app/models/movie.dart';

class MovieClient {
  Future<List<Movie>> findMovies(String category) async {
    final Response response = await client.get(
      Uri.parse('$API_BASE_URL/movie/$category?api_key=$API_KEY'),
    );

    List<Movie> movies = _toMoviesList(response);

    return movies;
  }

  static List<Movie> _toMoviesList(Response response) {
    final Map decodedJson = jsonDecode(response.body);

    final List<Movie> movies = decodedJson['results']
        .map<Movie>((movie) => Movie.fromJson(movie))
        .toList();

    return movies;
  }
}
