import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/buttons/mediaBtn.dart';
import 'package:mao_trailer_app/components/getMovieIdsList.dart';

class MoreBtn extends StatefulWidget {
  int pagenum;
  String param;
  List<Widget> list;
  MoreBtn({Key key, @required this.pagenum, @required this.list, @required this.param}) : super(key: key);

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

        setState(() {
          print(widget.pagenum);
          //increment pagenum
          widget.pagenum++;

          //pop this button off the list
          widget.list.removeLast();
        });

        //add next api page to the list
        getMovieIdsList(widget.pagenum, widget.param).then((List<int> ids) {
          setState(() {
            for (var i = 0; i < ids.length; i++) {
              widget.list.add(MediaBtn(
                id: ids[i],
              ));
            }
            widget.list.add(MoreBtn(list: widget.list, pagenum: widget.pagenum, param: widget.param));
          });
        });
      },
      child: Text("More"),
    );
  }
}
