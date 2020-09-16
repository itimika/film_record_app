import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie_model.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${Provider.of<MovieModel>(context, listen: false).query}の検索結果')),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int idx) {
          return ListTile(
              title: Text(Provider.of<MovieModel>(context).getTitle(idx)),
              onTap: () {
                Provider.of<MovieModel>(context, listen: false).saveMovieInfo(idx);
                Navigator.of(context).pushNamed('/infoPage');
              }
          );
        },
        itemCount: Provider.of<MovieModel>(context).listCount,
      ),
    );
  }
}