import 'package:flutter/material.dart';

class ButtonsGame2 extends StatelessWidget {
  final child;
  final function;
  static bool holdButton = false;
  ButtonsGame2({this.child, this.function});

  bool playerHoldsButton() {
    return holdButton;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        holdButton = true;
        function();
      },
      onTapUp: (details) {
        holdButton = false;
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: EdgeInsets.all(10),
            child: child,
            color: Colors.brown[300],
          )),
    );
  }
}
