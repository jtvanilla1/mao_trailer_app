import 'package:flutter/material.dart';
import 'package:mao_trailer_app/theme/style.dart';

class SearchResults extends StatelessWidget {

  const SearchResults({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme().primaryColorDark,
      appBar: AppBar(
        title: Text('Search Results'),
        backgroundColor: appTheme().primaryColor,
        elevation: 0,
        actions: <Widget>[
          
        ]
      ),
    );
  }
}