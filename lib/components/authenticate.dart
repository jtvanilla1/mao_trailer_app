import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/loginScreen.dart';
import 'package:mao_trailer_app/components/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView() => setState(()  => showSignIn = !showSignIn);

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginScreen(toggleView: toggleView);
    }
    else {
      return Register(toggleView: toggleView);
    }
  }
}