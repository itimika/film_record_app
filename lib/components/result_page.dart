import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/titles.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('${Provider.of<Titles>(context, listen: false).query}の検索結果'),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int idx) {
                return ListTile(
                  title: Text(Provider.of<Titles>(context).getTitle(idx)),
                  onTap: () => Navigator.of(context).pushNamed('/infoPage'),
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