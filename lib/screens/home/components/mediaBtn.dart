import 'package:flutter/material.dart';

class MediaBtn extends StatefulWidget {
  final int index;
  MediaBtn({Key key, this.index}) : super(key: key);

  @override
  _MediaBtnState createState() => _MediaBtnState();
}

class _MediaBtnState extends State<MediaBtn> {
  @override
  Widget build(BuildContext context) {
    //IconButton with ImageIcon as background
    return IconButton(
      icon: Icon(Icons.movie),
      onPressed: (){
        print(widget.index);
        //navigate to corresponding movie page, or generate widget?
      },
    );
  }
}