import 'package:flutter/material.dart';
import 'package:mao_trailer_app/services/tmdb.dart';

class SmallMediaBtn extends StatefulWidget {
  SmallMediaBtn({Key key}) : super(key: key);

  @override
  _SmallMediaBtnState createState() => _SmallMediaBtnState();
}

class _SmallMediaBtnState extends State<SmallMediaBtn> {
  
  final imageUrl = "https://image.tmdb.org/t/p/original/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg";

  @override
  Widget build(BuildContext context) {
    //IconButton with ImageIcon as background
    //get image from TMDb API
    //Future<Movie> futureMovie = getMovie();

    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(border: Border.all(width: 1,)),
      child: IconButton(
        // icon: FutureBuilder(
        //   future: futureMovie.getImageFromPath(),
        //   builder: (context, snapshot) {
        //     if(snapshot.connectionState == ConnectionState.done){
        //       return Text(snapshot.data.title);
        //     }
        //     else {
        //       return CircularProgressIndicator();
        //     }
        //   }
        // ),
        icon: Image.network(imageUrl),
        onPressed: (){
          //navigate to corresponding movie page, or generate widget?
        },
      ),
    );
  }
}