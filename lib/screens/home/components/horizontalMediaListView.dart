import 'package:flutter/material.dart';

Widget horizontalMediaListView(List<Widget> mediaList) {
  return Container(
    height: 210,
    child: ListView.builder(
      padding: EdgeInsets.all(15),
      itemCount: mediaList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          width: 140,
          child: Container(
            child: mediaList[index]
          ),
        );
      },
      scrollDirection: Axis.horizontal,
    ),
  );
}