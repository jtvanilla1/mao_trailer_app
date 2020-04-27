import 'package:flutter/widgets.dart';
import 'package:mao_trailer_app/screens/home/searchresults/searchresults.dart';

import 'screens/splash/splashScreen.dart';
import 'screens/intro/introPages.dart';
import 'screens/authenticate/loginScreen.dart';
import 'screens/home/profile/settingsScreen.dart';
import 'screens/error/errorScreen.dart';
import 'screens/wrapper.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/splash": (BuildContext context) => SplashScreen(),
  "/wrap": (BuildContext context) => Wrapper(),
  "/intro": (BuildContext context) => IntroPages(),
  "/login": (BuildContext context) => LoginScreen(),
  "/settings": (BuildContext context) => SettingsScreen(),
  "/error": (BuildContext context) => ErrorScreen(),
  "/search": (BuildContext context) => SearchResults()
};