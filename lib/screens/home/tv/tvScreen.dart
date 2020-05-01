import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/horizontalMediaListView.dart';
import 'package:mao_trailer_app/screens/home/components/verticalMediaListView.dart';
import 'package:mao_trailer_app/screens/home/components/MediaBtn.dart';

class TvScreen extends StatelessWidget {
  final PageController controller;
  const TvScreen({Key key, this.controller}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    List<Widget> nowMediaList = [
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),

    ];
    List<Widget> popularMediaList = [
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
      MediaBtn(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Now"),
            horizontalMediaListView(nowMediaList),
            Text("Popular"),
            verticalMediaListView(popularMediaList),
          ],
        ),
      ),
    );
  }
}