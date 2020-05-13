import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/mediaBtn.dart';
import 'package:mao_trailer_app/components/mediaGridView.dart';
import 'package:mao_trailer_app/components/profileBtnItems.dart';
import 'package:mao_trailer_app/components/toggleBtns.dart';

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

        SizedBox(height: 300, child: buildMediaGridView(context, mediaList[0]))
      ],
    );
  }
}


  