import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/getMovieIdsList.dart';
import 'package:mao_trailer_app/components/horizontalMediaListView.dart';
import 'package:mao_trailer_app/components/buttons/mediaBtn.dart';
import 'package:mao_trailer_app/components/buttons/moreBtn.dart';
import 'package:mao_trailer_app/components/topNavBar.dart';

//top-level values so adding more pages doesnt get reset
List<int> idList = List<int>();
List<Widget> nowMediaList = List<Widget>();
List<Widget> popularMediaList1 = List<Widget>();
List<Widget> popularMediaList2 = List<Widget>();
int popularPageNum = 2;
int nowPageNum = 1;

class MoviesScreen extends StatefulWidget {
  final PageController controller;
  const MoviesScreen({Key key, this.controller}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();

    if (idList.isEmpty &&
        nowMediaList.isEmpty &&
        popularMediaList1.isEmpty &&
        popularMediaList2.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        //get list of currently playing movies
        getMovieIdsList(1, "now_playing").then((List<int> ids) {
          setState(() {
            idList = ids;
            print("nowlist: $idList");
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
            print("poplist 1: $idList");
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

        //get second of popular movie Ids
        getMovieIdsList(2, "popular").then((List<int> ids) {
          setState(() {
            idList = ids;
            print("poplist 2: $idList");
            for (var i = 0; i < idList.length; i++) {
              popularMediaList2.add(MediaBtn(
                id: idList[i],
              ));
            }
            popularMediaList2.add(MoreBtn(
                list: popularMediaList2,
                pagenum: popularPageNum,
                param: "popular"));
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //build media buttons with movie Ids

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
                horizontalMediaListView(popularMediaList1),
                horizontalMediaListView(popularMediaList2)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
