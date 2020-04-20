import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

//Load app data for splash screen init
  void load(){
  print('loading data... transitioning to login screen');
  //TODO: sharedpreferences for boolean: load tutorial pages or no
  Navigator.pushReplacementNamed(context, '/login');

}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //load();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            //TODO: get background image
            image: AssetImage("assets/images/placeholder.PNG"),
            fit: BoxFit.fitWidth,
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