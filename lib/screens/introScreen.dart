import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/introPage.dart';
import 'package:mao_trailer_app/theme/style.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> imageNames = ['intro1.png','intro2.png','intro3.png','placeholder.png'];
    List<String> titles = ['intro1 title','intro2 title','intro3 title','intro4 title'];
    List<Function> buttonFunctions = [_nextButton, _getStartedButton];

    final controller = PageController(initialPage: 0,);

    return PageView(
      controller: controller,
      children: <Widget>[
        IntroPage(controller: controller, titleText: titles[0], backgroundImageName: imageNames[0], button: buttonFunctions[0],),
        IntroPage(controller: controller, titleText: titles[1], backgroundImageName: imageNames[1], button: buttonFunctions[0],),
        IntroPage(controller: controller, titleText: titles[2], backgroundImageName: imageNames[2], button: buttonFunctions[0],),
        IntroPage(controller: controller, titleText: titles[3], backgroundImageName: imageNames[3], button: buttonFunctions[1],),
      ],
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

  _getStartedButton(BuildContext context, PageController controller) {
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


