import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';

class SettingsScreen extends StatelessWidget {
  final PageController controller;
  const SettingsScreen({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              
            },
          ),
        ]
      ),
    );
  }
}