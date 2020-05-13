import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/movie.dart';
import 'package:mao_trailer_app/screens/movieOverviewScreen.dart';

class MediaBtn extends StatelessWidget {
  final String id;

  MediaBtn({
    Key key,
    this.id,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    Future<Movie> movie = getMovie(id);

    return FutureBuilder<Movie> (
      future: movie,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return MovieDisplay(movie: snapshot.data);
        } else if (snapshot.hasError) {
            return Text(snapshot.error);
        }
        else {
          return CircularProgressIndicator();
        }
      },
    );
  }

}

class MovieDisplay extends StatelessWidget {
  final Movie movie;
  const MovieDisplay({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        print(movie.originalTitle);
        buildMoviePage(context, movie);
      },
      child: movie.posterImage,
    );
  }
}