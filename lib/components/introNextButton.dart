import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';

Container nextButton(BuildContext context, PageController controller){
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
      print("navigating to next page");
      //Navigator.pushReplacementNamed(context, '$route');
      controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
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
