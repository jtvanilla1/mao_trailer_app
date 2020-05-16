import 'dart:convert';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mao_trailer_app/components/buttons/mediaBtn.dart';
import 'package:mao_trailer_app/models/movie_model.dart';
import 'package:mao_trailer_app/components/mediaGridView.dart';
import 'package:mao_trailer_app/services/keys.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<MediaBtn> mediaList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: <Widget>[
          //back button
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
            child: IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(Icons.arrow_back), 
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
          //searchbar
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SearchBar<Movie>(
                onSearch: searchMovie,
                onItemFound: (Movie movie, int index) {
                  //build mediaList based on movies
                  

                  //display gridview of MediaBtns based on search value
                  //buildMediaGridView(context, mediaList);
                  return ListTile(
                    title: Text(movie.originalTitle),
                    subtitle: Text(movie.overview),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Future<List<Movie>> searchMovie(String query) async {
  int pagenum = 1;
  final String url = "https://api.themoviedb.org/3/search/movie?api_key=$TMDB_KEY&language=en-US&query=$query&page=$pagenum&include_adult=false";

  List<Movie> results = List<Movie>();

  http.Response response = await http.get(url);

  Map<String, dynamic> data = json.decode(response.body);
  //get movieIds
  if (response.statusCode == 200) {
    int numResults = data['results'].length;
    
    for (int i = 0; i < numResults; i++) {
      int id = data['results'][i]['id'];
      results.add(await getMovie(id));
    }
  } else {
    throw Exception('Failed to load movies');
  }


  return results;
}

