//external packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//local packages
import 'services/auth.dart';
import 'theme/style.dart';
import 'routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Mao Trailer',
        theme: appTheme(),
        initialRoute: '/splash',
        routes: routes,
      ),
    );
  }
}