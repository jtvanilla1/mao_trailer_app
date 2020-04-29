import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/home/components/bottomNavBar.dart';
import 'package:mao_trailer_app/services/auth.dart';

import 'movies/moviesScreen.dart';
import 'profile/profileScreen.dart';
import 'tv/tvScreen.dart';
import 'components/topNavBar.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int bottomSelectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView(PageController controller) {
    return PageView(
      controller: controller,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        MoviesScreen(),
        TvScreen(),
        ProfileScreen(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController controller;
    return Scaffold(
      appBar: buildTopNavBar(context),
      body: buildPageView(controller),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        backgroundColor: Colors.orange,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}
