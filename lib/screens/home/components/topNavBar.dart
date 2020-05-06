import 'package:flutter/material.dart';

SliverAppBar buildTopNavBar(BuildContext context, int pageNum) {
  List<String> titles = ["Movies", "TV Shows", "Profile"];
  List<String> actions = ["/search", "/search", "/settings"];
  List<Icon> icons = [Icon(Icons.search), Icon(Icons.search), Icon(Icons.settings)];

  return SliverAppBar(
    pinned: true,
    floating: true,
    title: Text(titles[pageNum], style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
    backgroundColor: Colors.white,
    elevation: 10,
    actions: <Widget>[
      //Search button, popup search field
      IconButton(
        icon: icons[pageNum],
        iconSize: 50,
        onPressed: () async {
          Navigator.pushNamed(context, actions[pageNum]);
          
        },
      ),
    ]
  );
}