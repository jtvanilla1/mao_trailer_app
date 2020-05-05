import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/mediaBtn.dart';
import 'package:mao_trailer_app/screens/home/profile/components/mediaList.dart';
import 'package:mao_trailer_app/screens/home/profile/components/profileBtnItems.dart';
import 'package:mao_trailer_app/screens/home/profile/components/toggleBtns.dart';

class ProfileBtns extends StatefulWidget {
  @override
  _ProfileBtnsState createState() => _ProfileBtnsState();
}

class _ProfileBtnsState extends State<ProfileBtns> {
  List<bool> isSelected;
  int buttonIndex;
  int numLikes;
  int numWatching;
  int numComments;
  List<Widget> likeList;
  List<Widget> watchingList;
  List<Widget> commentsList;
  List<int> mediaNumList;
  List<List<Widget>> mediaList;



  @override
  void initState() {
    super.initState();
    isSelected = [true, false, false];
    buttonIndex = 0;
    numLikes = 3210;
    numWatching = 1232;
    numComments = 44;
    likeList = [];
    watchingList = [];
    commentsList = [];
    mediaNumList = [numLikes, numWatching, numComments];
    mediaList = [likeList, watchingList, commentsList];
    for (var i = 0; i < 80; i++) {
      likeList.add(MediaBtn(index: i,));
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        //control buttons
        Center(
          child: ToggleButtons(
            children: buildProfileBtnItems(isSelected, mediaNumList),
            onPressed: (int index) {
              //switch to new button selected
              setState(() => toggleBtns(isSelected, index));
              //scroll to next pageview of gridviews
            },
            isSelected: isSelected,
          ),
        ),
        SizedBox(height: 10),

        //display listview of grids
        //TODO: figure out how to display 

        // Container(
        //   child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     children: <Widget> [
        //       SizedBox(
        //         height: 300, 
        //         child: buildMediaList(context, mediaList[0])
        //       ),
        //       SizedBox(
        //         height: 300, 
        //         child: buildMediaList(context, mediaList[1])
        //       ),
        //       SizedBox(
        //         height: 300, 
        //         child: buildMediaList(context, mediaList[2])
        //       ),
        //     ]
        //   ),
        // ),
        buildMediaList(context, mediaList[0])
      ],
    );
  }
}


  