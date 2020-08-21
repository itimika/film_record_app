import 'repositories/movie_api_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

void main() async {
  await DotEnv().load('.env');
  TMDBClient.fetchMovie('ドラえもん').then((movies) => {
    movies.forEach((movie) => {
      print(movie.title)
    })
  });
}