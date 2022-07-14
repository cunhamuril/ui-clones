import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/config/api.dart';
import 'package:movie_app/http/client.dart';
import 'package:movie_app/models/genre.dart';

class GenreClient {
  Future<List<Genre>> findAllGenres() async {
    final Response response = await client.get(
      Uri.parse(
        '$API_BASE_URL/genre/movie/list?api_key=$API_KEY&language=pt-BR',
      ),
    );

    return _toGenresList(response);
  }

  static List<Genre> _toGenresList(Response response) {
    final Map decodedJson = jsonDecode(response.body);

    final List<Genre> genres = decodedJson['genres']
        .map<Genre>((genre) => Genre.fromJson(genre))
        .toList();

    return genres;
  }
}
