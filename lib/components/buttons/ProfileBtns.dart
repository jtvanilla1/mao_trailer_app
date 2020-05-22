import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/buttons/mediaBtn.dart';

class ProfileBtns extends StatefulWidget {
  @override
  _ProfileBtnsState createState() => _ProfileBtnsState();
}

class _ProfileBtnsState extends State<ProfileBtns> {
  int numFavorites;
  List<Widget> favoritesList;

  @override
  void initState() {
    super.initState();
    //TODO: init favorites list with database or something
    favoritesList = [];

    numFavorites = favoritesList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //control buttons

        //display listview of grids
        _buildFavoritesGridView(context, favoritesList)
      ],
    );
  }

  _buildFavoritesGridView(BuildContext context, List<Widget> favoritesList) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(15),
      itemCount: favoritesList.length,
      primary: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.5)),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Container(child: favoritesList[index]),
        );
      },
    );
  }
}
