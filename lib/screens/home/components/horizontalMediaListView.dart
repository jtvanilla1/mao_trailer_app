import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/moreBtn.dart';

Widget horizontalMediaListView(List<Widget> mediaList) {
  mediaList.add(MoreBtn()); //add MoreBtn to the end of whatever is passed
  return Container(
    height: 150,
    child: ListView.builder(
      padding: EdgeInsets.all(15),
      itemCount: mediaList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          width: 150,
          child: Container(
            //decoration: BoxDecoration(border: Border.all(width: 1)),
            padding: EdgeInsets.all(12),
            child: mediaList[index]
            ),
        );
      },
      scrollDirection: Axis.horizontal,
    ),
  );
}