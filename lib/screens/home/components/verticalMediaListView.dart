import 'package:flutter/material.dart';
import 'moreBtn.dart';

Widget verticalMediaListView(List<Widget> mediaList) {
  mediaList.add(MoreBtn()); //add MoreBtn to the end of whatever is passed

  return Expanded(
    child: Container(
      child: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: mediaList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            height: 150,
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