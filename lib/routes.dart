import 'package:flutter/widgets.dart';

import 'package:mao_trailer_app/screens/splash/splashScreen.dart';
import 'package:mao_trailer_app/screens/intro/intro1Screen.dart';
import 'package:mao_trailer_app/screens/intro/intro2Screen.dart';
import 'package:mao_trailer_app/screens/intro/intro3Screen.dart';
import 'package:mao_trailer_app/screens/intro/intro4Screen.dart';
import 'package:mao_trailer_app/screens/login/loginScreen.dart';
import 'package:mao_trailer_app/screens/movies/moviesScreen.dart';
import 'package:mao_trailer_app/screens/tv/tvScreen.dart';
import 'package:mao_trailer_app/screens/profile/profileScreen.dart';
import 'package:mao_trailer_app/screens/profile/settingsScreen.dart';
import 'package:mao_trailer_app/screens/error/errorScreen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/splash": (BuildContext context) => SplashScreen(),
  "/intro1": (BuildContext context) => Intro1Screen(),
  "/intro2": (BuildContext context) => Intro2Screen(),
  "/intro3": (BuildContext context) => Intro3Screen(),
  "/intro4": (BuildContext context) => Intro4Screen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/movies": (BuildContext context) => MoviesScreen(),
  "/tv": (BuildContext context) => TvScreen(),
  "/profile": (BuildContext context) => ProfileScreen(),
  "/settings": (BuildContext context) => SettingsScreen(),
  "/error": (BuildContext context) => ErrorScreen()
};