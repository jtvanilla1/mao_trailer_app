import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';

class Intro4Screen extends StatefulWidget {
  const Intro4Screen({Key key}) : super(key: key);

  @override
  _Intro4ScreenState createState() => _Intro4ScreenState();
}

class _Intro4ScreenState extends State<Intro4Screen> {
  void nextPage(){
    //TODO: implement same animation as PageView scroll right/left
    //TODO: consider not using pushReplacementRoute so slide left-right easily, then pop everything on push to login
    print("navigating to login");
    //Navigator.pushReplacementNamed(context, '/login');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            //TODO: get background image
            image: AssetImage("assets/images/placeholder.PNG"),
            fit: BoxFit.cover,
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 300,), //top padding
                Expanded( //single container for text, icons, next button; bottom aligned
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        Text("INTRO 4", 
                          style: TextStyle(
                            //TODO : get fonts
                            color: appTheme().primaryColor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20,), // spacing between title and icons
                        Row( // 4 icons in a row, light up current corresponding page icon
                          children: <Widget>[
                            Icon(
                              //TODO: get main icon
                              Icons.error,
                              color: appTheme().primaryColor.withOpacity(0.5),
                              size: 30.0,
                            ),
                            Icon(
                              //TODO: get main icon
                              Icons.error,
                              color: appTheme().primaryColor.withOpacity(0.5),
                              size: 30.0,
                            ),
                            Icon(
                              //TODO: get main icon
                              Icons.error,
                              color: appTheme().primaryColor.withOpacity(0.5),
                              size: 30.0,
                            ),
                            Icon(
                              //TODO: get main icon
                              Icons.error,
                              color: appTheme().primaryColor,
                              size: 30.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 20,), // spacing between icons and
                        Container(
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
                                onPressed: nextPage,
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
                        )
                      ]
                    ),
                  ),
                ),
                SizedBox(height: 20,) //bottom padding
              ]

            ),
          ],
        ),
      ),
    );
  }
}