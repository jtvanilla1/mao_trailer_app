import 'package:flutter/material.dart';

class MovieBtn extends StatefulWidget {
  MovieBtn({Key key}) : super(key: key);

  @override
  _MovieBtnState createState() => _MovieBtnState();
}

class _MovieBtnState extends State<MovieBtn> {
  
  final imageUrl = "https://image.tmdb.org/t/p/original/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg";

  @override
  Widget build(BuildContext context) {
    //IconButton with ImageIcon as background
    //get image from TMDb API
    return Container(
      //TODO: get dimensions from api
      width: 150,
      height: 150,
      decoration: BoxDecoration(border: Border.all(width: 1,)),
      child: IconButton(
        icon: Image.network(imageUrl),
        onPressed: (){
          //navigate to corresponding movie page, or generate widget?
        },
      ),
    );
  }
}