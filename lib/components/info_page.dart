import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie_model.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Provider.of<MovieModel>(context).movie.title,
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.network('https://image.tmdb.org/t/p/original'
                '${Provider.of<MovieModel>(context, listen: false).movie.backdropPath}'
            ),
            Text('あらすじ'),
            Text(
              Provider.of<MovieModel>(context, listen: false).movie.overview
                  ?? 'データがありません',
            ),
          ],
        ),
      ),
    );
  }
}