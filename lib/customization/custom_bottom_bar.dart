import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomBar extends StatelessWidget {
  final TabController controller;

  const CustomBottomBar({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              controller.animateTo(0);
            },
          ),
          IconButton(
            icon: Icon(Icons.border_all),
            onPressed: () {
              controller.animateTo(1);
            },
          ),
          IconButton(
            icon: Icon(Icons.work),
            onPressed: () {
              controller.animateTo(2);
            },
          ),
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {
              controller.animateTo(3);
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              controller.animateTo(4);
            },
          )
        ],
      ),
    );
  }
}
