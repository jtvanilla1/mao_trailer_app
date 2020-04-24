import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';
import 'package:mao_trailer_app/screens/intro/components/getStartedButton.dart';
import 'package:mao_trailer_app/screens/intro/components/imagebg.dart';
import 'package:mao_trailer_app/components/gradientbg.dart';
import 'package:mao_trailer_app/screens/intro/components/pageIcons.dart';

class Intro4Screen extends StatefulWidget {
  final PageController controller;

  const Intro4Screen({Key key, this.controller}) : super(key: key);

  @override
  _Intro4ScreenState createState() => _Intro4ScreenState();
}

class _Intro4ScreenState extends State<Intro4Screen> {
  List<Color> listOfColors = [Color(0xFF142246),Color(0xFF142246).withOpacity(0.8), Color(0x00000000)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          imagebg('placeholder.PNG'),
          Container( //gradient
            decoration:gradientbg(listOfColors),
            child: Row( //details
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 450,), //top padding
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
                            pageIcons(3),
                            SizedBox(height: 20,), // spacing between icons and
                            getStartedButton(context),
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
        ],
        
      ),
    );
  }
}