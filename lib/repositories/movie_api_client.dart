import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class TMDBClient {
  static const _apiKey = '69c81d7e545cc1d52278d5b3074cd89b';

  static Future<List<dynamic>> fetchMovie(String query) async {
    final url = 'https://api.themoviedb.org/3/search/movie?api_key=$_apiKey'
        '&language=ja-JA&query=$query';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonArray = json.decode(response.body);
      return jsonArray['results'].map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movie.');
    }
  }
}