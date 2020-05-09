import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/getMovieIdsList.dart';
import 'package:mao_trailer_app/screens/home/components/horizontalMediaListView.dart';
import 'package:mao_trailer_app/screens/home/components/MediaBtn.dart';
import 'package:mao_trailer_app/screens/home/components/moreBtn.dart';
import 'package:mao_trailer_app/screens/home/components/topNavBar.dart';

class MoviesScreen extends StatefulWidget {
  final PageController controller;
  const MoviesScreen({Key key, this.controller}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<String> popIdList = List<String>();
  List<Widget> nowMediaList = List<Widget>();
  List<Widget> popularMediaList = List<Widget>();



  @override
  Widget build(BuildContext context) {
    getPopularMovieIdsList(1).then(
      (List<String> popids) {
        setState(() {
          popIdList = popids;
        });
      }
    );

    for (var i = 0; i < popIdList.length; i++) {
      nowMediaList.add(MediaBtn(
        id: popIdList[i],
      ));
      popularMediaList.add(MediaBtn(
        id: popIdList[i],
      ));
    }
    nowMediaList.add(MoreBtn());
    popularMediaList.add(MoreBtn());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          buildTopNavBar(context, 0),
          SliverList(
            delegate: SliverChildListDelegate(
              [
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
                    ),
                  ),
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
                    ),
                  ),
                ),
                horizontalMediaListView(popularMediaList),
                horizontalMediaListView(popularMediaList)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
