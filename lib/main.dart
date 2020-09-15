import 'package:film_sample_app/repositories/movie_api_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/titles.dart';

import 'package:flutter/widgets.dart';
import 'components/search_page.dart';
import 'components/result_page.dart';

main() async {
  await DotEnv().load('assets/.env');
  /*TMDBClient.fetchMovie('ドラえもん').then((value) => {
    value.forEach((movie) => {
      print(movie.title)
    }),
  });*/
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Titles>(
      create: (_) => Titles(),
      child: MaterialApp(
        home: SearchPage(),
        routes: <String, WidgetBuilder> {
          '/resultPage' : (BuildContext context) => ResultPage(),
        },
      ),
    );
  }
}
