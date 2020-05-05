import 'package:flutter/material.dart';

Widget verticalMediaListView(List<Widget> mediaList) {
  return Expanded(
    child: Container(
      child: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: mediaList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            height: 180,
            child: Container(
            //decoration: BoxDecoration(border: Border.all(width: 1)),
            padding: EdgeInsets.all(12),
            child: mediaList[index]
            ),
          );
        },
        scrollDirection: Axis.vertical,
      ),
    ),
  );
}