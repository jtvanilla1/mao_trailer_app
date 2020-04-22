import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';
import 'package:mao_trailer_app/screens/intro/components/nextButton.dart';
import 'package:mao_trailer_app/screens/intro/components/imagebg.dart';
import 'package:mao_trailer_app/components/gradientbg.dart';
import 'package:mao_trailer_app/screens/intro/components/pageIcons.dart';

class Intro1Screen extends StatefulWidget {
  final PageController controller;

  const Intro1Screen({Key key, this.controller}) : super(key: key);

  @override
  _Intro1ScreenState createState() => _Intro1ScreenState();
}

class _Intro1ScreenState extends State<Intro1Screen> {
  List<Color> listOfColors = [Color(0xFFB62E59).withOpacity(0.5), Color(0xFF813F2E), Color(0xFF813F2E).withOpacity(0.5), Color(0x00000000)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          imagebg('intro1.png'),
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
                            Text("Know the movie is not worth Watching", 
                              style: TextStyle(
                                //TODO : get fonts
                                color: appTheme().primaryColor,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 20,), // spacing between title and icons
                            pageIcons(0),
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