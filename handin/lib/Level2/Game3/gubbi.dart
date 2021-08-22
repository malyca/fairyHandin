import 'package:flutter/material.dart';

class Shooter extends StatelessWidget {
  final direction;

  Shooter({this.direction});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100, height: 110, child: Image.asset("asset/shooter.png"));
  }
}
