import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Expanded(
            child: SafeArea(
              child: Padding(
              padding: EdgeInsets.fromLTRB(60, 0, 20, 0),
              child: SearchBar(onSearch: null, onItemFound: null),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text("search results go here"),
        ),
      ),
    );
  }
}
