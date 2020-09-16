import 'package:film_sample_app/repositories/movie_api_client.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'movie.dart';

class MovieModel with ChangeNotifier {
  var _list = <dynamic>[];
  var query = '';

  Movie movie;

  List<String> get list => _list;
  int get listCount => _list.length;

  void searchMovies(String keyword) async {
    query = keyword;
    TMDBClient.fetchMovie(keyword).then((movies) {
      _list = movies;
      notifyListeners();
    });
  }

  String getTitle(int idx) {
    return _list[idx].title;
  }

  int getId(int idx) {
    return _list[idx].id;
  }

  void saveMovieInfo(int idx) {
    movie = _list[idx];
    notifyListeners();
  }
}