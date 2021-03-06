import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie_model.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Film Record')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'search title.',
              ),
              onSubmitted: (val) {
                if (val.length > 0) {
                  Provider.of<MovieModel>(context, listen: false).searchMovies(val);
                  Navigator.of(context).pushNamed('/resultPage');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

