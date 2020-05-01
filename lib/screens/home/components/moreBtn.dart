import 'package:flutter/material.dart';

class MoreBtn extends StatelessWidget {
  const MoreBtn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
    color: Colors.orange,
    onPressed: (){
      
    },
    child: Text("More"),
  );
  }
}