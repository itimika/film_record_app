import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/movie.dart';

class TMDBClient {
  static Future<List<Movie>> fetchMovie(String query) async {
    final url = 'https://api.themoviedb.org/3/search/movie?'
        'api_key=${DotEnv().env['CLIENT_KEY']}'
        '&language=ja-JA&query=$query';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<Movie> list = [];
      final Map<String, dynamic> jsonArray = json.decode(response.body);
      for (var movie in jsonArray['results']) {
        list.add(Movie.fromJson(movie));
      }
      return list;
    } else {
      print('error!!');
      throw Exception('Failed to load movie.');
    }
  }
}