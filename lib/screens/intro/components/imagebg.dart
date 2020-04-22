import 'package:flutter/material.dart';

Container imagebg(String imageName){
  return Container( //image
    decoration:BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/$imageName"),
        fit: BoxFit.cover,
      ),
    ),
  );
}