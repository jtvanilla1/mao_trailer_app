import 'package:flutter/material.dart';

Widget horizontalMediaListView(List<Widget> mediaList) {
  return Container(
    height: 210,
    child: ListView.builder(
      padding: EdgeInsets.all(15),
      itemCount: mediaList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          //decoration: BoxDecoration(border: Border.all(width: 1)),
          width: 140,
          child: Container(
            child: mediaList[index],
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
                bottomLeft: Radius.circular(2),
                bottomRight: Radius.circular(2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                )
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5),
        );
      },
      scrollDirection: Axis.horizontal,
    ),
  );
}
