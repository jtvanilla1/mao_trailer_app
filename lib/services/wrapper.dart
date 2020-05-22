import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/authenticate.dart';
import 'package:mao_trailer_app/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    
    _loadIntroOrLogin(context);

    if(user == null){ //if no user logged in, authenticate
      return Authenticate();
    }

    return Home();
  }

  void _loadIntroOrLogin(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final firstTimeOpened = prefs.getBool('firstTimeOpened');
     if (firstTimeOpened == null) {
       prefs.setBool('firstTimeOpened', false);
       Navigator.pushReplacementNamed(context, '/intro');
     }
  }
}
