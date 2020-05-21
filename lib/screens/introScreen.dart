import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/introPage.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> imageNames = ['intro1.png','intro2.png','intro3.png','placeholder.png'];
    List<String> titles = ['intro1 title','intro2 title','intro3 title','intro4 title'];

    //TODO: list of buttons to add the getStartedBtn?

    final controller = PageController(initialPage: 0,);

    return PageView(
      controller: controller,
      children: <Widget>[
        IntroPage(controller: controller, titleText: titles[0], backgroundImageName: imageNames[0],),
        IntroPage(controller: controller, titleText: titles[1], backgroundImageName: imageNames[1],),
        IntroPage(controller: controller, titleText: titles[2], backgroundImageName: imageNames[2],),
        IntroPage(controller: controller, titleText: titles[3], backgroundImageName: imageNames[3],),
      ],
    );
  }
}


