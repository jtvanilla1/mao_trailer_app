import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/authenticate/loginScreen.dart';

//TODO: listen for auth changes, loginScreen if not logged in, else transition to homescreen

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoginScreen(),
    );
  }
}