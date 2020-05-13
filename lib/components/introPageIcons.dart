import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';

Row pageIcons(int pageNum){
  Color opaqueColor = appTheme().primaryColor;
  Color tColor = opaqueColor.withOpacity(0.5);
  List<Color> listOfColors = [tColor, tColor, tColor, tColor];
  listOfColors[pageNum] = opaqueColor; //set current page to opaque



  return Row( // 4 icons in a row, light up current corresponding page icon
    children: <Widget>[
      Icon(
        //TODO: get main icon
        Icons.error,
        color: listOfColors.asMap()[0],
        size: 30.0,
      ),
      Icon(
        //TODO: get main icon
        Icons.error,
        color: listOfColors.asMap()[1],
        size: 30.0,
      ),
      Icon(
        //TODO: get main icon
        Icons.error,
        color: listOfColors.asMap()[2],
        size: 30.0,
      ),
      Icon(
        //TODO: get main icon
        Icons.error,
        color: listOfColors.asMap()[3],
        size: 30.0,
      ),
    ],
  );
}