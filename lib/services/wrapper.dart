import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/authenticate.dart';
import 'package:mao_trailer_app/screens/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('retrieving firebase user...');
    final user = Provider.of<FirebaseUser>(context);
    print(user);

    if(user == null){ //if no user logged in, authenticate
      return Authenticate();
    }

    return Home();
  }
}