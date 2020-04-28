import 'package:flutter/material.dart';
import 'movieBtn.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Widget> moviesList;
  Widget getMoreMoviesBtn() {
    return FlatButton(
      onPressed: () => setState(() {
          moviesList.removeLast(); //pop button
          moviesList += moviesList;
          moviesList.add(getMoreMoviesBtn());
          //TODO: update list when button clicked, and generate more buttons
      }),
      child: Text("More", style: TextStyle(fontSize: 20)),
      color: Colors.orange,
    );
  }


  @override
  Widget build(BuildContext context) {
    moviesList = <Widget> [
      MovieBtn(),
      MovieBtn(),
      MovieBtn(),
      MovieBtn(),
      MovieBtn(),
      MovieBtn(),
      MovieBtn(),
      MovieBtn(),
      MovieBtn(),
      getMoreMoviesBtn(),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: moviesList,
      ),
    );
  }
}