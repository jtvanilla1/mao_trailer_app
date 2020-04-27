import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/movieList.dart';
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
      appBar: AppBar(
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
      ),
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

          AppBar(
          backgroundColor: appTheme().primaryColor,
          elevation: 0,
          //pageview controller buttons
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.movie),
              onPressed: (){
                controller.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: Icon(Icons.tv),
              onPressed: (){
                controller.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: (){
                controller.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
          ],
        )

        ]
      ),
    );
  }
}