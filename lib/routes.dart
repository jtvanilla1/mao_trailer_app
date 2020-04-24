import 'package:flutter/widgets.dart';

import 'screens/splash/splashScreen.dart';
import 'screens/intro/introPages.dart';
import 'screens/authenticate/loginScreen.dart';
import 'screens/movies/moviesScreen.dart';
import 'screens/tv/tvScreen.dart';
import 'screens/profile/profileScreen.dart';
import 'screens/profile/settingsScreen.dart';
import 'screens/error/errorScreen.dart';
import 'screens/wrapper.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/splash": (BuildContext context) => SplashScreen(),
  "/wrap": (BuildContext context) => Wrapper(),
  "/intro": (BuildContext context) => IntroPages(),
  "/login": (BuildContext context) => LoginScreen(),
  "/movies": (BuildContext context) => MoviesScreen(),
  "/tv": (BuildContext context) => TvScreen(),
  "/profile": (BuildContext context) => ProfileScreen(),
  "/settings": (BuildContext context) => SettingsScreen(),
  "/error": (BuildContext context) => ErrorScreen()
};