import 'package:flutter/material.dart';
import 'package:mao_trailer_app/services/auth.dart';
import 'package:mao_trailer_app/theme/style.dart';

import 'movies/moviesScreen.dart';
import 'profile/profileScreen.dart';
import 'tv/tvScreen.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);

    return Stack(
      children: <Widget>[
        PageView(
          controller: controller,
          children: <Widget>[
          MoviesScreen(controller: controller),
          TvScreen(controller: controller),
          ProfileScreen(controller: controller)
          ],
        ),
      ] 
    );
  }
}

