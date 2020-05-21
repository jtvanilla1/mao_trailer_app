import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/gradientbg.dart';
import 'package:mao_trailer_app/components/horizontalMediaListView.dart';
import 'package:mao_trailer_app/models/movie_model.dart';
import 'package:mao_trailer_app/screens/videoScreen.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;
  List<Widget> castList = List<Widget>();

  MoviePage({Key key, this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            //background image
            Expanded(
              flex: 3,
              child: Stack(
                children: <Widget>[
                  //background
                  _getBackdrop(context),

                  //gradient
                  Container(
                    decoration: gradientbg([Colors.black, Colors.transparent]),
                  ),

                  //appbar
                  _getAppBar(context),
                  //Title
                  _getTitle(context),
                  //play trailer button
                  _getTrailerBtn(context),
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
                  _getPosterImage(context),

                  //statistics
                  _getStats(context),

                  //overview
                  _getOverview(context),
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

  _getTitle(BuildContext context) {
    return Positioned(
      bottom: 5,
      left: 140,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width * 0.6,
        height: 70,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            movie.originalTitle,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }

  _getAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 10, right: 20),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: () {
                  print("share button pressed");
                })
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

  _getBackdrop(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: movie.backgroundImage,
      ),
    );
  }

  _getPosterImage(BuildContext context) {
    return Positioned(
      top: -80,
      left: 20,
      child: Container(
        height: 150,
        width: 100,
        child: movie.posterImage,
      ),
    );
  }

  _getTrailerBtn(BuildContext context) {
    return Positioned(
      top: (MediaQuery.of(context).size.width * 0.25),
      left: (MediaQuery.of(context).size.width * 0.5) - 20,
      child: InkResponse(
        onTap: () {
          print("share button pressed");
          _playTrailer(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Icon(
            Icons.play_circle_filled,
            color: Colors.orange,
            size: 80,
          ),
        ),
      ),
    );
  }

  _getStats(BuildContext context) {
    return Positioned(
      top: 10,
      left: 140,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getGenresList(movie),
            Text("Popularity: ${movie.popularity.toString()}")
          ],
        ),
      ),
    );
  }

  _getGenresList(Movie movie) {
    List<Widget> list = List<Widget>();
    for (var i = 0; i < movie.genres.length; i++) {
      list.add(
        Text(
          "-${movie.genres[i]}-",
          style: TextStyle(fontSize: 12),
        ),
      );
    }
    return Wrap(
      runSpacing: 2,
      spacing: 4,
      children: list,
    );
  }

  _getOverview(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      top: 80,
      child: Container(
        child: Text(
          movie.overview,
          style: TextStyle(color: Colors.black),
        ),
      ),
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
    },
  );
}
