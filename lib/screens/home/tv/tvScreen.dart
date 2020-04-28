import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';

class TvScreen extends StatelessWidget {

  final PageController controller;

  const TvScreen({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme().primaryColorDark,
      body: Stack(
        children: <Widget> [
          //Title: "NOW"
          Text('NOW'),

          //Scrollable Row of Button widgets
          //MovieList(),

          //Title: "Popular"

          //Scrollable Row of Button widgets plus "see more" buttton that recursively adds more movies to the list
          //MovieList()

          //Scrollable Row of Button widgets
          //MovieList()

          //Bottom Navbar
          
        ]
      ),
    );
  }
}