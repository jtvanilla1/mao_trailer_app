import 'package:flutter/material.dart';

AppBar buildTopNavBar(BuildContext context) {
  //TODO: set navbar title to the title of the current page
  String title = "title";

  return AppBar(
    title: Text(title),
    backgroundColor: Colors.orange,
    elevation: 0,
    actions: <Widget>[
      //Search button, popup search field
      IconButton(
        icon: Icon(Icons.search),
        iconSize: 50,
        onPressed: () async {
          Navigator.pushNamed(context, '/search');
          
        },
      ),
    ]
  );
}