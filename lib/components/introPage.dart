import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';
import 'package:mao_trailer_app/components/introNextButton.dart';
import 'package:mao_trailer_app/components/introImagebg.dart';
import 'package:mao_trailer_app/components/gradientbg.dart';
import 'package:mao_trailer_app/components/introPageIcons.dart';

class IntroPage extends StatefulWidget {
  final PageController controller;
  final String backgroundImageName;
  final String titleText;

  const IntroPage(
      {Key key,
      this.controller,
      @required this.backgroundImageName,
      @required this.titleText})
      : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<Color> listOfColors = [
    Color(0xFFB62E59).withOpacity(0.5),
    Color(0xFF813F2E),
    Color(0xFF813F2E).withOpacity(0.5),
    Color(0x00000000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          imagebg(widget.backgroundImageName),
          Container(
            //gradient
            decoration: gradientbg(listOfColors),
            child: Row(
              //details
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 450,
                      ), //top padding
                      Expanded(
                        //single container for text, icons, next button; bottom aligned
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Column(children: <Widget>[
                            Text(
                              widget.titleText,
                              style: TextStyle(
                                color: appTheme().primaryColor,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ), // spacing between title and icons
                            pageIcons(0),
                            SizedBox(
                              height: 20,
                            ), // spacing between icons and
                            nextButton(context, widget.controller),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ) //bottom padding
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
