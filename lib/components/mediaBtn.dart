import 'package:flutter/material.dart';
import 'package:mao_trailer_app/models/movie_model.dart';

class MediaBtn extends StatelessWidget {
  final String id;

  MediaBtn({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<Movie> movie = getMovie(id);

    return FutureBuilder<Movie>(
      future: movie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MovieDisplay(movie: snapshot.data);
        } else if (snapshot.hasError) {
          return Text(snapshot.error);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

