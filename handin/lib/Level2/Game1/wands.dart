import 'package:flutter/material.dart';

class Wand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 30,
      decoration: BoxDecoration(
          image: new DecorationImage(
        image: new ExactAssetImage("asset/wand.png"),
      )),
    );
  }
}
