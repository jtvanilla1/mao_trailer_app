import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/movies/components/movie.dart';

class MediaBtn extends StatefulWidget {
  final int index;
  final Movie movie;
  //final Movie movie; //pass a Movie object to the button
  MediaBtn({Key key, this.index, this.movie}) : super(key: key);

  @override
  _MediaBtnState createState() => _MediaBtnState();
}

class _MediaBtnState extends State<MediaBtn> {
  @override
  Widget build(BuildContext context) {
    //IconButton with ImageIcon as background
    return IconButton(
      icon: Icon(Icons.movie),
      onPressed: (){
        print(widget.index);
        print(widget.movie.originalTitle);
        //build MoviePage widget, pass Movie object to it
      },
    );
  }
}