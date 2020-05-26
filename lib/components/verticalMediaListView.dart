import 'package:flutter/material.dart';

Widget verticalMediaListView(BuildContext context, List<Widget> mediaList) {
  return Container(
    //TODO: determine height of extendable list. How do I do this?
    height: MediaQuery.of(context).size.height*10,
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(15),
      itemCount: mediaList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(12),
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
