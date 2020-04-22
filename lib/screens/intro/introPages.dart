import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/intro/components/intro1Screen.dart';
import 'package:mao_trailer_app/screens/intro/components/intro2Screen.dart';
import 'package:mao_trailer_app/screens/intro/components/intro3Screen.dart';
import 'package:mao_trailer_app/screens/intro/components/intro4Screen.dart';
import 'package:mao_trailer_app/screens/login/loginScreen.dart';

class IntroPages extends StatefulWidget {
  @override
  _IntroPagesState createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  @override
  Widget build(BuildContext context) {

    final controller = PageController(initialPage: 0,);

    return PageView(
      controller: controller,
      children: <Widget>[
        Intro1Screen(controller: controller,),
        Intro2Screen(controller: controller,),
        Intro3Screen(controller: controller,),
        Intro4Screen(controller: controller,),
      ],
    );
  }
}


