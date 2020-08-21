import 'package:film_sample_app/repositories/movie_api_client.dart';
import 'package:flutter/material.dart';

class Titles extends ChangeNotifier {
  var _list = <dynamic>[];
  String _keyword = '';

  List<String> get list => _list;
  int get listCount => _list.length;

  void keyword(String val) {
    _keyword = val;
    notifyListeners();
  }

  void searchMovies() async {
    _list.clear();
    TMDBClient.fetchMovie(_keyword).then((movies) {
      movies.forEach((movie) => {
        _list.add(movie.toString())
      });
    });
    notifyListeners();
  }

  String getTitle(int idx) {
    return _list[idx];
  }
}