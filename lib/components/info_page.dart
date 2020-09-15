import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/titles.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Provider.of<Titles>(context).getId(id).toString())),
    );
  }
}