import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';
import 'package:mao_trailer_app/screens/intro/components/nextButton.dart';
import 'package:mao_trailer_app/screens/intro/components/imagebg.dart';
import 'package:mao_trailer_app/components/gradientbg.dart';
import 'package:mao_trailer_app/screens/intro/components/pageIcons.dart';

class Intro3Screen extends StatefulWidget {
  final PageController controller;

  const Intro3Screen({Key key, this.controller}) : super(key: key);

  @override
  _Intro3ScreenState createState() => _Intro3ScreenState();
}

class _Intro3ScreenState extends State<Intro3Screen> {
  List<Color> listOfColors = [Color(0xFF142246),Color(0xFF142246).withOpacity(0.8), Color(0x00000000)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          imagebg('intro3.png'),
          Container( //gradient
            decoration: gradientbg(listOfColors),
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
                            Text("INTRO 3", 
                              style: TextStyle(
                                //TODO : get fonts
                                color: appTheme().primaryColor,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 20,), // spacing between title and icons
                            pageIcons(2),
                            SizedBox(height: 20,), // spacing between icons and
                            nextButton(context, widget.controller),
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