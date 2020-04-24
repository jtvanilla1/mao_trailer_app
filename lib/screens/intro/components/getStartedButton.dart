import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';

Container getStartedButton(BuildContext context){
  return Container(
    margin: const EdgeInsets.all(30.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFF99F00), Color(0xFFDB3069)]),
      border: Border.all(
        width: 2, 
        ), 
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
    child: RawMaterialButton(
      onPressed: (){
        //TODO: implement same animation as PageView scroll right/left
        //TODO: consider not using pushReplacementRoute so slide left-right easily, then pop everything on push to login
        print("navigating to wrapper");
        Navigator.pushReplacementNamed(context, '/wrap');
      },
      child: Row(
        children: <Widget>[
          Text("       Get Started       ",
          style: TextStyle(
            color: appTheme().primaryColor,
            fontSize: 20,
            ),
          ),
        ],
      ),
      elevation: 2.0,
    ),
  );
}
