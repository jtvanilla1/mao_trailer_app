import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget buildMediaGridView(BuildContext context, List<Widget> mediaList) {
  return GridView.builder(
    shrinkWrap: true,
    padding: EdgeInsets.all(15),
    itemCount: mediaList.length,
    primary: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.5)),
    itemBuilder: (BuildContext context, int index) {
      return Container(
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Container(child: mediaList[index]),
      );
    },
  );
}
