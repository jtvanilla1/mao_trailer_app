import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/horizontalMediaListView.dart';
import 'package:mao_trailer_app/screens/home/components/MediaBtn.dart';
import 'package:mao_trailer_app/screens/home/components/moreBtn.dart';
import 'package:mao_trailer_app/screens/home/components/topNavBar.dart';

class MoviesScreen extends StatelessWidget {
  final PageController controller;
  const MoviesScreen({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> nowMediaList = [];
    List<Widget> popularMediaList = [];
    for (var i = 0; i < 20; i++) {
      nowMediaList.add(MediaBtn(
        index: i,
      ));
      popularMediaList.add(MediaBtn(
        index: i,
      ));
    }
    nowMediaList.add(MoreBtn());
    popularMediaList.add(MoreBtn());

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(shrinkWrap: true, children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              buildTopNavBar(context, 0),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Now",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          )),
                    ),
                    horizontalMediaListView(nowMediaList),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Popular",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          )),
                    ),
                    horizontalMediaListView(popularMediaList),
                    horizontalMediaListView(popularMediaList)
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
