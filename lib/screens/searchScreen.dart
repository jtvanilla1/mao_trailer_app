import 'dart:convert';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/buttons/mediaBtn.dart';
import 'package:mao_trailer_app/models/movie_model.dart';
import 'package:mao_trailer_app/services/APIService.dart';

class SearchScreen extends StatefulWidget {
  APIService apiService;
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
                onSearch: apiService.searchMovie,
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



