import 'package:flutter/material.dart';

class LargeMediaBtn extends StatefulWidget {
  LargeMediaBtn({Key key}) : super(key: key);

  @override
  _LargeMediaBtnState createState() => _LargeMediaBtnState();
}

class _LargeMediaBtnState extends State<LargeMediaBtn> {
  
  final imageUrl = "https://image.tmdb.org/t/p/original/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg";

  @override
  Widget build(BuildContext context) {
    //IconButton with ImageIcon as background
    //get image from TMDb API
    return Container(
      width: double.infinity,
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