import 'package:flutter/material.dart';
import 'package:mao_trailer_app/screens/tvScreen.dart';
import 'package:mao_trailer_app/screens/moviesScreen.dart';
import 'package:mao_trailer_app/screens/profileScreen.dart';

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

  Widget buildPageView() {
    return PageView(
      controller: pageController,
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
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: build array of titles, and widgets and build appbar based on index
      appBar: _buildTopNavBar(context, bottomSelectedIndex),
      body: buildPageView(),
      bottomNavigationBar: _buildBottomNavBar()
    );
  }

  _buildBottomNavBar () {
    return BottomNavigationBar(
      elevation: 20,
      selectedItemColor: Colors.orange,
      currentIndex: bottomSelectedIndex,
      backgroundColor: Colors.white,
      onTap: (index) {
        bottomTapped(index);
      },
      items: _bottomNavBarItems(),
    );
  }

  _bottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: new Icon(Icons.movie),
        title: new Text('Movies'),
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.tv),
        title: new Text('TV'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile'),
      )
    ];
  }

  _buildTopNavBar(BuildContext context, int pageNum) {
  List<String> titles = ["Movies", "TV Shows", "Profile"];
  List<String> actions = ["/search", "/search", "/settings"];
  List<Icon> icons = [Icon(Icons.search), Icon(Icons.search), Icon(Icons.settings)];

  return AppBar(
    title: Text(titles[pageNum], style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
    backgroundColor: Colors.white,
    elevation: 10,
    actions: <Widget>[
      //Search button, popup search field
      IconButton(
        icon: icons[pageNum],
        iconSize: 50,
        onPressed: () async {
          Navigator.pushNamed(context, actions[pageNum]);
          
        },
      ),
    ]
  );
}
}
