import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/topNavBar.dart';

import 'components/ProfileBtns.dart';

class ProfileScreen extends StatefulWidget {
  final PageController controller;

  const ProfileScreen({Key key, this.controller}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO: import profile data from server. Firebase for profile details?
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[

            //Title, settings button
            buildTopNavBar(context, 2),

            //Profile Picture
            Container(
              height: 200,
              child: Icon(
                Icons.person,
                //image: getProfilePicture(),
              ),
            ),

            //Name
            Text("Name"),
            SizedBox(height: 20),

            ProfileBtns(),

          ]
        ),
      )
    );
  }
}