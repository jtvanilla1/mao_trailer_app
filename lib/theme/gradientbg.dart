import 'package:flutter/material.dart';

BoxDecoration gradientbg(List<Color> listOfColors){
  return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: listOfColors,
      ),
    );
}