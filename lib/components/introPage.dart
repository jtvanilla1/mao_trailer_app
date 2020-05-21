import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';
import 'package:mao_trailer_app/components/gradientbg.dart';

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
          _imagebg(widget.backgroundImageName),
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
                            _pageIcons(0),
                            SizedBox(
                              height: 20,
                            ), // spacing between icons and
                            _nextButton(context, widget.controller),
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

  _nextButton(BuildContext context, PageController controller) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: appTheme().primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: RawMaterialButton(
        onPressed: () {
          print("navigating to next page");
          //Navigator.pushReplacementNamed(context, '$route');
          controller.nextPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        child: Row(
          children: <Widget>[
            Text(
              "Next Page",
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

  _imagebg(String imageName) {
    return Container(
      //image
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/$imageName"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _pageIcons(int pageNum) {
    Color opaqueColor = appTheme().primaryColor;
    Color tColor = opaqueColor.withOpacity(0.5);
    List<Color> listOfColors = [tColor, tColor, tColor, tColor];
    listOfColors[pageNum] = opaqueColor; //set current page to opaque

    return Row(
      // 4 icons in a row, light up current corresponding page icon
      children: <Widget>[
        Icon(
          //TODO: get main icon
          Icons.error,
          color: listOfColors.asMap()[0],
          size: 30.0,
        ),
        Icon(
          //TODO: get main icon
          Icons.error,
          color: listOfColors.asMap()[1],
          size: 30.0,
        ),
        Icon(
          //TODO: get main icon
          Icons.error,
          color: listOfColors.asMap()[2],
          size: 30.0,
        ),
        Icon(
          //TODO: get main icon
          Icons.error,
          color: listOfColors.asMap()[3],
          size: 30.0,
        ),
      ],
    );
  }

  //TODO: put this in the program somewhere
  _getStartedButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xFFF99F00), Color(0xFFDB3069)]),
        border: Border.all(
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: RawMaterialButton(
        onPressed: () {
          print("navigating to wrapper");
          Navigator.pushReplacementNamed(context, '/wrap');
        },
        child: Row(
          children: <Widget>[
            Text(
              "       Get Started       ",
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
}
