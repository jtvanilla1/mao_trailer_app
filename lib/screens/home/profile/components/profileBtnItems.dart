import 'package:flutter/material.dart';

List<Widget> buildProfileBtnItems(List<bool> isSelected, List<int> mediaNumList) {
  return [
    Column(
      children: <Widget>[
        Text(mediaNumList[0].toString(), style: btnStyle(isSelected, 0),),
        Text("Like"),
      ],
    ),
    Column(
      children: <Widget>[
        Text(mediaNumList[1].toString(), style: btnStyle(isSelected, 1),),
        Text("Watching"),
      ],
    ),
    Column(
      children: <Widget>[
        Text(mediaNumList[2].toString(), style: btnStyle(isSelected, 2),),
        Text("Comments"),
      ],
    ),
  ];
}

//change the style of the button based on which one is selected
TextStyle btnStyle(List<bool> isSelected, int btnIndex) {
  if (!isSelected[btnIndex]){
    return TextStyle(color: Colors.black, fontSize: 20);
  }
  else {
    return TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold);
  }
}