import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/mediaBtn.dart';
import 'package:mao_trailer_app/screens/home/movies/components/movie.dart';
import 'package:mao_trailer_app/screens/home/profile/components/mediaGridView.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key key}) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<MediaBtn> mediaList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: <Widget>[
          //back button
          IconButton(
            icon: Icon(Icons.arrow_back), 
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          //searchbar
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
