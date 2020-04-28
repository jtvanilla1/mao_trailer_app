import 'package:flutter/material.dart';

List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.movie),
          title: new Text('Movies')
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.tv),
        title: new Text('TV'),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile')
      )
    ];
  }