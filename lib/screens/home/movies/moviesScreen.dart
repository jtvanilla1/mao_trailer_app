import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/horizontalMediaListView.dart';
import 'package:mao_trailer_app/screens/home/components/MediaBtn.dart';

class MoviesScreen extends StatelessWidget {
  final PageController controller;
  const MoviesScreen({Key key, this.controller}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    List<Widget> nowMediaList = [];
    List<Widget> popularMediaList = [];
    for (var i = 0; i < 20; i++) {
      nowMediaList.add(MediaBtn(index: i,));
      popularMediaList.add(MediaBtn(index: i,));
    }
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            buildTopNavBar(context),
            Text("Now"),
            horizontalMediaListView(nowMediaList),
            Text("Popular"),
            horizontalMediaListView(popularMediaList),
            horizontalMediaListView(popularMediaList)
          ],
        ),
      ),
    );
  }
}


AppBar buildTopNavBar(BuildContext context) {
  String title = "Movies";

  return AppBar(
    title: Text(title),
    backgroundColor: Colors.white,
    elevation: 10,
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