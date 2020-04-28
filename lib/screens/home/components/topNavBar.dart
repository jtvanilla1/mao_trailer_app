import 'package:flutter/material.dart';

AppBar buildTopNavBar(BuildContext context) {
  return AppBar(
    title: Text('Movies'),
    backgroundColor: Colors.orange,
    elevation: 0,
    actions: <Widget>[
      //Search button, popup search field
      IconButton(
        icon: Icon(Icons.search),
        iconSize: 50,
        onPressed: () async {
          //TODO: add popup searchbar
          
          //TODO: add search results page, or display widget list of searched buttons? very difficult
          Navigator.pushNamed(context, '/search');
          
        },
      ),
    ]
  );
}