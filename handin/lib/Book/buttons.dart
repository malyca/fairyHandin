import 'package:flutter/material.dart';

class ButtonsForBook extends StatelessWidget {
  static bool holdButton = false;

  final icon;
  final function;
  ButtonsForBook({this.icon, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Center(
              child: Icon(icon),
            ),
          )),
    );
  }
}
