import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _loadIntroOrLogin(context);

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
