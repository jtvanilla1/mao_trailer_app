import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final PageController controller;
  SettingsScreen({Key key, this.controller}) : super(key: key);

  Widget getCacheSize() {
    return Text("cache size");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Clear cache button
            MaterialButton(
                elevation: 20,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Clear Cache"),
                    getCacheSize(),
                  ],
                )),

            //Spacing
            SizedBox(height: 20),

            //share, question, about buttons
            MaterialButton(
                elevation: 20, onPressed: () {}, child: Text("Share")),
            MaterialButton(
                elevation: 20, onPressed: () {}, child: Text("Give Feedback")),
            MaterialButton(
                elevation: 20, onPressed: () {}, child: Text("About")),

            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                  elevation: 20,
                  onPressed: () {},
                  child: MaterialButton(
                    child: Text("Sign Out"),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, '/wrap');
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
