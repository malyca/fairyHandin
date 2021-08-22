import 'package:flutter/material.dart';

class Wand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          image: new DecorationImage(
        image: new ExactAssetImage("asset/tooth.png"),
      )),
    );
  }
}
