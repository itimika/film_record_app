import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/titles.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Titles>(
      create: (BuildContext context) => Titles(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Film Record')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onChanged: (val) {
                      Provider.of<Titles>(context).keyword(val);
                    },
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Provider
                      .of<Titles>(context, listen: false)
                      .searchMovies();
                },
                child: Icon(Icons.search),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int idx) {
                return ListTile(
                  title: Text(Provider.of<Titles>(context).getTitle(idx)),
                );
              },
              itemCount: Provider.of<Titles>(context).listCount,
            ),
          ),
        ],
      ),
    );
  }
}