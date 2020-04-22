import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/gradientbg.dart';
import 'package:mao_trailer_app/theme/style.dart';
import 'package:mao_trailer_app/screens/intro/components/nextButton.dart';
import 'package:mao_trailer_app/screens/intro/components/imagebg.dart';
import 'package:mao_trailer_app/screens/intro/components/pageIcons.dart';


class Intro2Screen extends StatefulWidget {
  final PageController controller;

  const Intro2Screen({Key key, this.controller}) : super(key: key);

  @override
  _Intro2ScreenState createState() => _Intro2ScreenState();
}

class _Intro2ScreenState extends State<Intro2Screen> {
  List<Color> listOfColors = [Color(0xFFAE9632).withOpacity(0.8),Color(0xFFAE9632).withOpacity(0.5), Color(0x00000000)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          imagebg('intro2.png'),
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
                            Text("INTRO 2", 
                              style: TextStyle(
                                //TODO : get fonts
                                color: appTheme().primaryColor,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 20,), // spacing between title and icons
                            pageIcons(1),
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