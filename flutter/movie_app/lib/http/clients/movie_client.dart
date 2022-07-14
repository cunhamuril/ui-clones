import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/config/api.dart';
import 'package:movie_app/http/client.dart';
import 'package:movie_app/models/category.dart';
import 'package:movie_app/models/genre.dart';
import 'package:movie_app/models/movie.dart';

class MovieClient {
  Future<List<Movie>> findMovies(Category category, Genre? genre) async {
    Response response;

    if (genre != null && genre.id != 0) {
      String sortValue = '';

      switch (category.value) {
        case 'upcoming':
          sortValue = 'release_date.desc';
          break;

        case 'popular':
          sortValue = 'popularity.desc';
          break;

        case 'now_playing':
          sortValue = 'popularity.desc';
          break;

        case 'top_rated':
          sortValue = 'vote_count.desc';
          break;

        default:
          sortValue = '';
      }

      response = await client.get(
        Uri.parse(
          '$API_BASE_URL/discover/movie'
          '?api_key=$API_KEY'
          '&language=pt-BR'
          '&with_genres=${genre.id}'
          '&sort_by=$sortValue',
        ),
      );
    } else {
      response = await client.get(
        Uri.parse(
          '$API_BASE_URL/movie/${category.value}?api_key=$API_KEY&language=pt-BR',
        ),
      );
    }

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
