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
      Navigator.pushReplacementNamed(context, '/intro1');
    }
    else{
      print("navigating to login...");
      Navigator.pushReplacementNamed(context, '/login');
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            //TODO: get background image
            image: AssetImage("assets/images/placeholder.PNG"),
            fit: BoxFit.cover,
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 200,), //top padding
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.topCenter,
                    child: Column(
                      children: <Widget>[
                        //TODO: get and build loading animation here
                        Icon(
                          //TODO: get main icon
                          Icons.error,
                          color: appTheme().primaryColor,
                          size: 170.0,
                        ),
                        Text("Mao Trailer", 
                          style: TextStyle(
                            //TODO : get fonts
                            color: appTheme().primaryColor,
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Text("Copyright 2007",
                      style: TextStyle(
                        color: Color(0xFFEC98A1)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,) //bottom padding
              ]

            ),
          ],
        ),
      ),
    );
  }
}