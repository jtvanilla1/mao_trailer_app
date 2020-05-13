import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<bool> _isFirstTimeOpened() async {
    final prefs = await SharedPreferences.getInstance();
    final firstTimeOpened = prefs.getBool('firstTimeOpened');
    if(firstTimeOpened == null){ //if no recorded value for firstTimeOpened
      prefs.setBool('firstTimeOpened', false); //set future value to false so getBoolFromSharedPref will return false from now on
      return true;
    }
    return false; //should always return false if firstTimeOpened in sharedpreferences has a value
  }

//Load app data for splash screen init
  void loadIntroOrLogin() async {
    print("checking if first time opened...");
    bool firstTimeOpened = await _isFirstTimeOpened();
    print("firstTimeOpened: $firstTimeOpened");
    _routeToNextPage(firstTimeOpened);
  }

  void _routeToNextPage(bool firstTimeOpened) {

    if (firstTimeOpened){
      print("navigating to intro...");
      Navigator.pushReplacementNamed(context, '/intro');
    }
    else{
      print("navigating to login...");
      Navigator.pushReplacementNamed(context, '/wrap');
    }
  }

  @override
  void initState() {
    super.initState();
    loadIntroOrLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(image: AssetImage('background.png')),
    );
  }
}