import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';

Container nextButton(BuildContext context, String route){
  return Container(
    margin: const EdgeInsets.all(30.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      border: Border.all(
        width: 2, 
        color: appTheme().primaryColor
        ), 
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
    child: RawMaterialButton(
    onPressed: (){
      //TODO: implement same animation as PageView scroll right/left
      //TODO: consider not using pushReplacementRoute so slide left-right easily, then pop everything on push to login
      print("navigating to $route");
      Navigator.pushReplacementNamed(context, '$route');
    },
      child: Row(
        children: <Widget>[
          Text("Next Page",
            style: TextStyle(
              color: appTheme().primaryColor,
              fontSize: 20,
              ),
            ),
          Icon(
            Icons.play_arrow,
            color: appTheme().primaryColor,
            size: 35,
          ),
        ],
      ),
      elevation: 2.0,
    ),
  );
}
