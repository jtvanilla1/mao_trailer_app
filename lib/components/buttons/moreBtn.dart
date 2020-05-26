import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/buttons/mediaBtn.dart';
import 'package:mao_trailer_app/services/APIService.dart';

class MoreBtn extends StatefulWidget {
  int pagenum;
  String param;
  String mediaType;
  List<Widget> list;
  MoreBtn({Key key, @required this.mediaType, @required this.pagenum, @required this.list, @required this.param}) : super(key: key);

  @override
  _MoreBtnState createState() => _MoreBtnState();
}

class _MoreBtnState extends State<MoreBtn> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.orange,
      onPressed: () {
        print("More button pressed");

        //TODO: properly display new items in list
      },
      child: Text("More"),
    );
  }
}
