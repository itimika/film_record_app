import 'package:film_sample_app/repositories/movie_api_client.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class Titles with ChangeNotifier {
  var _list = <dynamic>[];
  var query = '';

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
}