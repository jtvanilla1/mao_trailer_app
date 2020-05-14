import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mao_trailer_app/services/authenticate.dart';
import 'package:mao_trailer_app/screens/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);

    if(user == null){ //if no user logged in, authenticate
      return Authenticate();
    }

    return Home();
  }
}