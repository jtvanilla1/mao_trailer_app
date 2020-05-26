import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/horizontalMediaListView.dart';
import 'package:mao_trailer_app/components/buttons/moreBtn.dart';
import 'package:mao_trailer_app/components/verticalMediaListView.dart';
import 'package:mao_trailer_app/components/buttons/mediaBtn.dart';
import 'package:mao_trailer_app/services/APIService.dart';

class TvScreen extends StatefulWidget {
  final PageController controller;

  String currentYear = DateTime.now().year.toString();
  TvScreen({Key key, this.controller}) : super(key: key);

  @override
  _TvScreenState createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  List<int> idList;
  List<Widget> nowMediaList;
  List<Widget> popularMediaList1;
  int popularPageNum;
  int nowPageNum;
  String currentYear;
  String params;
  String currentParams;

  @override
  void initState() {
    super.initState();
    popularPageNum = 2;
    nowPageNum = 1;
    currentYear = DateTime.now().year.toString();
    params = 'language=en-US&sort_by=popularity.desc&timezone=America&include_null_first_air_dates=false';
    //currentParams = params + '&primary_release_year=$currentYear';

    idList = List<int>();
    nowMediaList = List<Widget>();
    popularMediaList1 = List<Widget>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //get list of currently playing tv
      apiService
          .getIdsList(
              mediaType: 'tv',
              pageNum: 1,
              params: params)
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

      //get first of popular tv Ids
      apiService
          .getIdsList(mediaType: 'tv', pageNum: 1, params: params)
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
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
                //TODO: fix scroll so that when top is reached, it scrolls the page up
                verticalMediaListView(context, popularMediaList1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
