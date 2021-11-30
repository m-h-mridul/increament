import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Style.dart';
import 'modeing.dart';

class Searchlist extends StatelessWidget {
  String mName;
  Searchlist(this.mName, {Key? key}) : super(key: key);
  searchseries() async {
    String baseURL = ' https://api.tvmaze.com/search/shows?q=';
    var url = Uri.parse(baseURL + mName);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.body);
      return Pokedex.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post: ');
    }
  }

  @override
  Widget build(BuildContext context) {
    Pokedex p = searchseries();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Pokedex>(
            future: searchseries(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(children: [
                  Image.network(
                    p.show.image.medium,
                  ),
                  Text(p.show.name, style: Style().logh2style),
                ]);
              } else {
                return Text('Result not found', style: Style().logh2style);
              }
            }),
      ),
    );
  }
}
