import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/movies/components/movie.dart';


class MoviePage extends StatelessWidget {
  final Movie movie;

  MoviePage(this.movie);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomScrollView(
        slivers: <Widget>[
          //transparent appbar with background image
          SliverAppBar(
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: movie.backgroundImage,
            ),
            actions: <Widget>[
              Text("Back", textAlign: TextAlign.left,),
              //share button
              IconButton(
                icon: Icon(Icons.share, color: Colors.white),
                padding: const EdgeInsets.only(right: 15),
                onPressed: () {
                  //share app url to this page; no idea how to do that
                },
              )
            ],
          ),

          //body
          SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                overflow: Overflow.visible,
              ),
            ]),
          )
        ],
      ),
    );
  }
}

void buildMoviePage(BuildContext context, Movie movie) {
  showModalBottomSheet(context: context, builder: (BuildContext bc) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: MoviePage(movie)
      ),
    );
  });
}