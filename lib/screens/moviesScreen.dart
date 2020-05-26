import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/horizontalMediaListView.dart';
import 'package:mao_trailer_app/components/buttons/mediaBtn.dart';
import 'package:mao_trailer_app/components/buttons/moreBtn.dart';
import 'package:mao_trailer_app/services/APIService.dart';

//top-level values so adding more pages doesnt get reset
List<int> idList = List<int>();
List<Widget> nowMediaList = List<Widget>();
List<Widget> popularMediaList1 = List<Widget>();
List<Widget> popularMediaList2 = List<Widget>();

//TODO: implement bloc stream for popular pages so that each morebtn increments the same stream
int popularPageNum = 2;
int nowPageNum = 1;
String currentYear = DateTime.now().year.toString();
String params =
    'language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false';
String currentParams = params + '&primary_release_year=$currentYear';

class MoviesScreen extends StatefulWidget {
  final PageController controller;
  String currentYear;
  String params;
  String currentParams;

  MoviesScreen({Key key, this.controller}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    currentYear = DateTime.now().year.toString();
    params = 'language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false';
    currentParams = params + '&primary_release_year=$currentYear';

    if (idList.isEmpty &&
        nowMediaList.isEmpty &&
        popularMediaList1.isEmpty &&
        popularMediaList2.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        //get list of currently playing movies
        //============================
        //
        //============================
        apiService
            .getIdsList(mediaType: 'movie', pageNum: 1, params: currentParams)
            .then((List<int> ids) {
          setState(() {
            idList = ids;
            for (var i = 0; i < idList.length; i++) {
              nowMediaList.add(MediaBtn(
                id: idList[i],
              ));
            }
            
          });
        });

        //get first of popular movie Ids
        apiService
            .getIdsList(mediaType: 'movie', pageNum: 1, params: params)
            .then((List<int> ids) {
          setState(() {
            idList = ids;
            for (var i = 0; i < idList.length; i++) {
              popularMediaList1.add(MediaBtn(
                id: idList[i],
              ));
            }
          });
        });

        //get second of popular movie Ids
        apiService
            .getIdsList(mediaType: 'movie', pageNum: 2, params: params)
            .then((List<int> ids) {
          setState(() {
            idList = ids;
            for (var i = 0; i < idList.length; i++) {
              popularMediaList2.add(MediaBtn(
                id: idList[i],
              ));
            }
            
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
