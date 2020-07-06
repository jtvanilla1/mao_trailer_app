//external packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//local packages
import 'theme/style.dart';
import 'services/routes.dart';

void main() {
  //status bar color
  //TODO: do this or AnnotatedRegion<SystemUIOverlayStyle>() for main/all widgets?
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.white,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Trailers',
      theme: appTheme(),
      initialRoute: '/wrap',
      routes: routes,
    );
  }
}
