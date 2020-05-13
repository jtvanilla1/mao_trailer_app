import 'package:flutter/material.dart';

Widget verticalMediaListView(BuildContext context, List<Widget> mediaList) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: ListView.builder(
      padding: EdgeInsets.all(15),
      itemCount: mediaList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(12),
          //decoration: BoxDecoration(border: Border.all(width: 1)),
          width: 180,
          child: Container(
            child: mediaList[index]
          ),
        );
      },
      scrollDirection: Axis.vertical,
    ),
  );
}
