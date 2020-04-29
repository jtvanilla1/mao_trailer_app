import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/largeMediaBtn.dart';

class VerticalBtnList extends StatefulWidget {
  
  @override
  _VerticalBtnListState createState() => _VerticalBtnListState();
}

class _VerticalBtnListState extends State<VerticalBtnList> {
  List<Widget> moviesList;
  Widget getMoreMoviesBtn() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(border: Border.all(width: 1),color: Colors.orange),
      child: FlatButton(
        onPressed: () {},
        child: Text("More",
          style: TextStyle(
            fontSize: 40
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    //TOD: create custom movie widget
    moviesList = <Widget> [
      LargeMediaBtn(),
      LargeMediaBtn(),
      LargeMediaBtn(),
      LargeMediaBtn(),
      getMoreMoviesBtn(),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      scrollDirection: Axis.vertical,
      child: Column(
        children: moviesList,
      ),
    );
  }
}