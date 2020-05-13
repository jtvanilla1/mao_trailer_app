import 'package:flutter/widgets.dart';
import 'package:mao_trailer_app/screens/searchScreen.dart';

import 'screens/splashScreen.dart';
import 'screens/introScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/settingsScreen.dart';
import 'services/wrapper.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/splash": (BuildContext context) => SplashScreen(),
  "/wrap": (BuildContext context) => Wrapper(),
  "/intro": (BuildContext context) => IntroScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/settings": (BuildContext context) => SettingsScreen(),
  "/search": (BuildContext context) => SearchResults()
};