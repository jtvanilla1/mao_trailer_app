import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/getMovieIdsList.dart';
import 'package:mao_trailer_app/components/horizontalMediaListView.dart';
import 'package:mao_trailer_app/components/buttons/moreBtn.dart';
import 'package:mao_trailer_app/components/topNavBar.dart';
import 'package:mao_trailer_app/components/verticalMediaListView.dart';
import 'package:mao_trailer_app/components/buttons/mediaBtn.dart';

class TvScreen extends StatefulWidget {
  final PageController controller;
  const TvScreen({Key key, this.controller}) : super(key: key);

  @override
  _TvScreenState createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  List<int> idList;
  List<Widget> nowMediaList;
  List<Widget> popularMediaList1;
  int popularPageNum;
  int nowPageNum;

  @override
  void initState() {
    super.initState();
    popularPageNum = 2;
    nowPageNum = 1;

    idList = List<int>();
    nowMediaList = List<Widget>();
    popularMediaList1 = List<Widget>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //get list of currently playing movies
      getMovieIdsList(1, "now_playing").then((List<int> ids) {
        setState(() {
          idList = ids;
          for (var i = 0; i < idList.length; i++) {
            nowMediaList.add(MediaBtn(
              id: idList[i],
            ));
          }
          nowMediaList.add(MoreBtn(
              list: nowMediaList, pagenum: nowPageNum, param: "now_playing"));
        });
      });

      //get first of popular movie Ids
      getMovieIdsList(1, "popular").then((List<int> ids) {
        setState(() {
          idList = ids;
          for (var i = 0; i < idList.length; i++) {
            popularMediaList1.add(MediaBtn(
              id: idList[i],
            ));
          }
          popularMediaList1.add(MoreBtn(
              list: popularMediaList1,
              pagenum: popularPageNum,
              param: "popular"));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          buildTopNavBar(context, 1),
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
                //TODO: fix scroll so that when top is reached, it scrolls the page up
                verticalMediaListView(context, popularMediaList1)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
