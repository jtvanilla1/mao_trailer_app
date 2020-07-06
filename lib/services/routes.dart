import 'package:flutter/widgets.dart';
import 'package:mao_trailer_app/screens/introScreen.dart';
import 'package:mao_trailer_app/screens/searchScreen.dart';
import 'package:mao_trailer_app/screens/settingsScreen.dart';
import 'package:mao_trailer_app/services/wrapper.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/wrap": (BuildContext context) => Wrapper(),
  "/intro": (BuildContext context) => IntroScreen(),
  "/settings": (BuildContext context) => SettingsScreen(),
  "/search": (BuildContext context) => SearchScreen()
};
