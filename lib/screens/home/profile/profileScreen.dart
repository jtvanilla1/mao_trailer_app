import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/mediaBtn.dart';
import 'package:mao_trailer_app/theme/style.dart';

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
    int numLikes = 3210;
    int numWatching = 1232;
    int numComments = 44;
    List<bool> isSelected = [true, false, false];
    List<Widget> likeList = [];
    for (var i = 0; i < 80; i++) {
      likeList.add(MediaBtn(index: i,));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            //Title, settings button
            buildTopNavBar(context),
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
            //Like,Watching,Comments buttons
            ToggleButtons(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(numLikes.toString(), style: TextStyle(color: Colors.red, fontSize: 20),),
                    Text("Like"),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(numWatching.toString(), style: TextStyle(color: Colors.red, fontSize: 20),),
                    Text("Watching"),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(numComments.toString(), style: TextStyle(color: Colors.red, fontSize: 20),),
                    Text("Comments"),
                  ],
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++)
                    if(buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    }
                    else {
                      isSelected[buttonIndex] = false;
                    }
                });
              },
              isSelected: isSelected,
            ),

            // 4-wide pageview of vertical scrolls
            Container(
              child: buildMediaList(likeList),
            )
          ]
        ),
      )
    );
  }
}

Widget buildMediaList (List<Widget> mediaList) {
  return Expanded(
    child: Container(
      child: GridView.builder(
        padding: EdgeInsets.all(15),
        itemCount: mediaList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 4, crossAxisSpacing: 4, mainAxisSpacing: 4
        ), 
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Container(
              padding: EdgeInsets.all(12),
              child: mediaList[index]
            ),
          );
        },
      )
    ),
  );
}

AppBar buildTopNavBar(BuildContext context) {
  String title = "Profile";

  return AppBar(
    title: Text(title),
    backgroundColor: Colors.white,
    elevation: 10,
    actions: <Widget>[
      //Search button, popup search field
      IconButton(
        icon: Icon(Icons.settings),
        iconSize: 50,
        onPressed: () async {
          Navigator.pushNamed(context, '/settings');
          
        },
      ),
    ]
  );
}
