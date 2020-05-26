import 'package:flutter/material.dart';
import 'package:mao_trailer_app/models/movie_model.dart';
import 'package:mao_trailer_app/models/tvShow_model.dart';
import 'package:mao_trailer_app/screens/moviePage.dart';
import 'package:mao_trailer_app/services/MovieService.dart';

class MediaBtn extends StatefulWidget {
  final int id;
  MovieService movieService;
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
    widget.movieService = MovieService();
    widget.movie = widget.movieService.getMovie(widget.id);
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
          return null;
        } else {
          return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange));
        }
      },
    );
  }

  _buildMovieBtnContent(BuildContext context, Movie movie) {
    return MaterialButton(
      onPressed: () {
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
      },
      child: movie.posterImage,
    );
  }

  _buildTvShowBtnContent(BuildContext context, TvShow tvShow) {
    return MaterialButton(
      onPressed: () {
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
                  child: TvPage(
                    show: tvShow,
                  ),
                ),
              ],
            );
          },
        );
      },
      child: tvShow.posterImage,
    );
  }
}
