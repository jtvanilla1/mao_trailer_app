import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/gradientbg.dart';
import 'package:mao_trailer_app/components/horizontalMediaListView.dart';
import 'package:mao_trailer_app/models/movie_model.dart';
import 'package:mao_trailer_app/screens/videoScreen.dart';
import 'package:mao_trailer_app/components/imagebg.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;
  List<Widget> castList = List<Widget>();

  MoviePage({Key key, this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            iconSize: 50,
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Text(movie.originalTitle),
          ),
        ),
        body: Column(
          children: <Widget>[
            //background image
            Expanded(
              flex: 3,
              child: Stack(
                children: <Widget>[
                  //background
                  imagebg('placeholder.png'),
                  //gradient
                  Container(
                    decoration: gradientbg([Colors.black, Colors.transparent]),
                  ),
                  //play trailer button
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          Icons.play_circle_filled,
                          color: Colors.orange,
                          size: 50,
                        ),
                        onPressed: () {
                          print("share button pressed");
                          _playTrailer(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Stack
            Expanded(
              flex: 3,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  //poster image
                  Positioned(
                    top: -80,
                    left: 20,
                    child: Container(
                      height: 150,
                      width: 100,
                      child: movie.posterImage,
                    ),
                  ),

                  //Stats column
                  Positioned(
                    top: -50,
                    left: 140,
                    child: Row(
                      children: <Widget>[
                        //title
                        Text(
                          movie.originalTitle,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        //genres

                        //popularity
                        Text(movie.popularity.toString()),
                      ],
                    ),
                  ),

                  //overview
                  Positioned(
                    left: 20,
                    right: 20,
                    top: 80,
                    child: Container(
                      child: Text(
                        movie.overview,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: horizontalMediaListView(castList),
              ),
            )
          ],
        ),
      ),
    );
  }

  _playTrailer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            padding: EdgeInsets.all(10),
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 1),
                  blurRadius: 6,
                )
              ],
            ),
            child: Container(
              child: VideoScreen(
                id: movie.youtubeId,
                title: movie.originalTitle,
              ),
              height: 250,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        );
      }),
    );
  }
}

buildMoviePage(BuildContext context, Movie movie) {
  showModalBottomSheet<dynamic>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: MoviePage(
                movie: movie,
              ),
            ),
          ],
        );
      });
}
