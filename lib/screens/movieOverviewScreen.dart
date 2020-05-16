import 'package:flutter/material.dart';
import 'package:mao_trailer_app/models/movie_model.dart';
import 'package:mao_trailer_app/screens/videoScreen.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;

  MoviePage({Key key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
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
        ],
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container()
        ],
      )),
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
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: MoviePage(
            movie: movie,
          ),
        );
      });
}
