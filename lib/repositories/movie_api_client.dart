import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/movie.dart';

class TMDBClient {
  static Future<List<dynamic>> fetchMovie(String query) async {
    final url = 'https://api.themoviedb.org/3/search/movie?'
        'api_key=${DotEnv().env['CLIENT_KEY']}'
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