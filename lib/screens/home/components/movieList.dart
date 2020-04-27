import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {

  Future<List<Widget>> _addToList(List<Widget> moviesList) async{
    //get 10 more movie widgets
    //loop x10 -> await buildMovieWidget(), add to moviesList

    return moviesList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> moviesList;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        //children: _addToList(moviesList),
        
      ),
    );
  }
}