import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/buttons/ProfileBtns.dart';
import 'package:mao_trailer_app/services/auth.dart';


class ProfileScreen extends StatefulWidget {
  final AuthService _auth = AuthService();
  final PageController controller;

  ProfileScreen({Key key, this.controller}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO: import profile data from server. Firebase for profile details?

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(shrinkWrap: true, slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            IconButton(icon: Icon(Icons.exit_to_app), onPressed: widget._auth.signOut),
            Container(
              height: 200,
              child: Icon(
                Icons.person,
                //image: getProfilePicture(),
              ),
            ),

            //Name
            Text("Name", textAlign: TextAlign.center,),
            SizedBox(height: 20),

            ProfileBtns(),
          ]),
        )
      ]),
    );
  }
}
