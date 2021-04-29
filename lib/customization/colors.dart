import 'package:flutter/material.dart';

const Color yellow = Colors.white;
const Color darkgreen = Color.fromRGBO(0,100,0,1);
const Color mediumYellow = Colors.white;
const Color darkYellow = Colors.white;
const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);
const Color darkGrey = Color(0xff202020);
const Color lightGrey = Color(0xff676870);
const Color lightbrown = Color(0xffCC9D76);
const Color lightblack = Color(0xff272833);
const Color advancegreen=Color(0xff3C6F66);
const Color green = Color.fromRGBO(60, 111, 102, 1);
const Color backgroundColor =Color(0xFFfbf9f8) ;
const Color lightgreen = Color.fromRGBO(60, 111, 102, 0.5);
const Color cream = Color.fromRGBO(204, 157, 118, 1);
const Color lightcream = Color.fromRGBO(204, 157, 118, 0.5);

const LinearGradient mainButton = LinearGradient(colors: [
  Colors.redAccent,Colors.redAccent,Colors.redAccent
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}