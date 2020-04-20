//external packages
import 'package:flutter/material.dart';

//local packages
import 'package:mao_trailer_app/theme/style.dart';
import 'routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mao Trailer',
      theme: appTheme(),
      initialRoute: '/splash',
      routes: routes,
    );
  }
}