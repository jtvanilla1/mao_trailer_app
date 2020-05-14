import 'package:flutter/material.dart';
import 'package:mao_trailer_app/models/movie_model.dart';

class TrailerPlayer extends StatefulWidget {
  final Movie movie;

  TrailerPlayer({Key key, this.movie});

  @override
  _TrailerPlayerState createState() => _TrailerPlayerState();
}

class _TrailerPlayerState extends State<TrailerPlayer> {
  VoidCallback listener;

  String youtubeApiKey = 'AIzaSyCFsB88OyTe_zY0YixwsxWZJu2kWpoNUVE';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}