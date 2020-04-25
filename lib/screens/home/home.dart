import 'package:flutter/material.dart';
import 'package:mao_trailer_app/services/auth.dart';
import 'package:mao_trailer_app/theme/style.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    //TODO: build PageView for all app pages running through this Home() widget? or navigate? which works better? -> research
    return Scaffold(
      backgroundColor: appTheme().primaryColorDark,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: appTheme().primaryColor,
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            label: Text('Logout'),
            icon: Icon(Icons.person),
            onPressed: () async {
              await _auth.signOut();
              
            },
          ),
        ]
      ),
    );
  }
}