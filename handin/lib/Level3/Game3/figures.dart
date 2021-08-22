import 'package:fairytales/Globals/globalvariables.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'level_3_game_3.dart';

Random random = new Random();

int numberofFigure = 0;

class Figures extends StatelessWidget {
  final figurex;
  final figurey;

  Figures({this.figurex, this.figurey});

  @override
  Widget build(BuildContext context) {
    if (callFigure == false) {
      numberofFigure = random.nextInt(20);
      callFigure = true;
    }
    return Container(
      child: Container(
          height: 100, width: 100, child: Image.asset(squares[numberofFigure])),
    );
  }
}
