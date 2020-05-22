//external packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//local packages
import 'services/auth.dart';
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
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mao Trailer',
        theme: appTheme(),
        initialRoute: '/wrap',
        routes: routes,
      ),
    );
  }
}