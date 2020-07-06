import 'package:flutter/material.dart';

Widget horizontalMediaListView(List<Widget> mediaList) {
  return Container(
    height: 178,
    child: ListView.builder(
      padding: EdgeInsets.all(1),
      itemCount: mediaList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 140,
          child: mediaList[index],
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blue[200].withOpacity(0.5),
                spreadRadius: -10,
                blurRadius: 2,
              )
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 5),
        );
      },
      scrollDirection: Axis.horizontal,
    ),
  );
}
