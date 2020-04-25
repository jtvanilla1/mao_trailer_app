import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';
import 'home/home.dart';

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