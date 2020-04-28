import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/movies/components/movieList.dart';
import 'package:mao_trailer_app/theme/style.dart';

class MoviesScreen extends StatelessWidget {
  final PageController controller;
  const MoviesScreen({Key key, this.controller}) : super(key: key);


  
  //getlist of movie widgets with recursive add
  Future< List<Widget> > _getListOfMovieWidgets() async {
    List<Widget> movieWidgets;
    //create X (10?) widgets
    
    //if seemore button pressed
    
    return movieWidgets;
  }

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
          MovieList(),

          //Title: "Popular"
          Text('POPULAR', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          //Scrollable Row of Button widgets plus "see more" buttton that recursively adds more movies to the list
          MovieList(),

          //Scrollable Row of Button widgets
          MovieList(),

        ]
      ),
    );
  }
}