import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/smallMediaBtn.dart';

class HorizontalBtnList extends StatefulWidget {
  
  @override
  _HorizontalBtnListState createState() => _HorizontalBtnListState();
}

class _HorizontalBtnListState extends State<HorizontalBtnList> {
  List<Widget> moviesList;
  Widget getMoreMoviesBtn() {
    return Container(
      height: 150,
      width: 150,
      child: FlatButton(
        onPressed: () {},
        child: Text("More", style: TextStyle(fontSize: 20)),
        color: Colors.orange,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    //TOD: create custom movie widget
    moviesList = <Widget> [
      SmallMediaBtn(),
      SmallMediaBtn(),
      SmallMediaBtn(),
      getMoreMoviesBtn(),
    ];

    return SingleChildScrollView(
      //TODO: when end of list reached, make scrolling further right/left jump to next page
      padding: EdgeInsets.all(15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: moviesList,
      ),
    );
  }
}