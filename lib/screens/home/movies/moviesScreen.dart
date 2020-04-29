import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/horizontalBtnList.dart';
import 'package:mao_trailer_app/theme/style.dart';

class MoviesScreen extends StatelessWidget {
  final PageController controller;
  const MoviesScreen({Key key, this.controller}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme().primaryColorDark,
      //Action Bar
      
      body: Column(
        children: <Widget> [
          //Title: "NOW"
          Text('NOW', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

          //Scrollable Row of Button widgets
          HorizontalBtnList(),

          //Title: "Popular"
          Text('POPULAR', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          //Scrollable Row of Button widgets plus "see more" buttton that recursively adds more movies to the list
          HorizontalBtnList(),

          //Scrollable Row of Button widgets
          HorizontalBtnList(),

        ]
      ),
    );
  }
}