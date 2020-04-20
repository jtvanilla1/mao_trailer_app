import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
          ],
        ),
      ),
    );
  }
}