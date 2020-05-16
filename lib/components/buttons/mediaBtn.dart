import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mao_trailer_app/models/movie_model.dart';
import 'package:mao_trailer_app/screens/movieOverviewScreen.dart';

class MediaBtn extends StatefulWidget {
  final int id;
  Future<Movie> movie;

  MediaBtn({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  _MediaBtnState createState() => _MediaBtnState();
}

class _MediaBtnState extends State<MediaBtn> {
  @override
  void initState() { 
    super.initState();
    widget.movie = getMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
      future: widget.movie,
      builder: (context, snapshot) {
        //TODO: snapshot error being called randomly; RangeError (index): Invalid value: Valid value range is empty: 0
        if (snapshot.hasData) {
          return _buildMovieBtnContent(context, snapshot.data);
        } else if (snapshot.hasError) {
          print(snapshot.requireData);
          //return Text(snapshot.requireData.toString());
          return null;
        } else {
          return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.orange));
        }
      },
    );
  }

  _buildMovieBtnContent(BuildContext context, Movie movie) {
    return MaterialButton(
      onPressed: () {
        buildMoviePage(context, movie);
      },
      child: movie.posterImage,
    );
  }
}
