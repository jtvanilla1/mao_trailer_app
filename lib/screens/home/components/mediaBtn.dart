import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/movies/components/movie.dart';

class MediaBtn extends StatefulWidget {
  final int index;
  //final Movie movie = Movie(id: "500");
  //final Movie movie; //pass a Movie object to the button
  MediaBtn({
    Key key,
    this.index,
    /*this.movie*/
  }) : super(key: key);

  @override
  _MediaBtnState createState() => _MediaBtnState();
}

class _MediaBtnState extends State<MediaBtn> {
  Future<Movie> movie;

  @override
  void initState() {
    super.initState();
    movie = getMovie("76341");
  }

  @override
  Widget build(BuildContext context) {

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

      },
      child: movie.posterImage,
    );
  }
}