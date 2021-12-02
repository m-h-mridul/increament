// ignore_for_file: must_be_immutable, avoid_function_literals_in_foreach_calls

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Style.dart';
import '../../media.dart';
import 'modeing.dart';

class Searchlist extends StatelessWidget {
  String mName;
  Searchlist(this.mName, {Key? key}) : super(key: key);
  Future<List<Pokedex>> searchseries() async {
    String baseURL = 'https://api.tvmaze.com/search/shows?q=';
    var url = Uri.parse(baseURL + mName);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // print();
      return pokedexFromJson(response.body);
    } else {
      throw Exception('Failed to load post: ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<Pokedex>>(
            future: searchseries(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                // ignore: curly_braces_in_flow_control_structures
                return Center(
                    child: Text('Result not found', style: Style().logh2style));
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Image.network(
                            snapshot.data![i].show.image.original,
                            width:MediaQuerypage.screenWidth!/2),
                      ListTile(
                        title: Text(snapshot.data![i].show.name),
                        subtitle: Column(
                          children: [
                            Text(snapshot.data![i].show.genres.toString()),
                            Text(snapshot.data![i].show.rating.toString())
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text('Result not found', style: Style().logh2style);
              }
            }),
      ),
    );
  }
}
