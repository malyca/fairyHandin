import 'package:fairytales/Globals/globalvariables.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'level_1_game_3.dart';

Random random = new Random();

int numberofDontShootFigure = 0;

class DontShoot extends StatelessWidget {
  final figx;
  final figy;

  DontShoot({this.figx, this.figy});

  @override
  Widget build(BuildContext context) {
    if (callDontshootFigure == false) {
      numberofDontShootFigure = random.nextInt(20);
      callDontshootFigure = true;
    }
    return Container(
      child: Container(
        child: Stack(
          children: [
            Container(
                height: 100,
                width: 100,
                child: Image.asset(squares[numberofDontShootFigure])),
          ],
        ),
      ),
    );
  }
}

class DontShootThis extends StatelessWidget {
  final figx;
  final figy;

  DontShootThis({this.figx, this.figy});

  @override
  Widget build(BuildContext context) {
    if (callDontshootFigure_1 == false) {
      numberofDontShootFigure = random.nextInt(20);
      callDontshootFigure_1 = true;
    }
    return Container(
      child: Container(
        child: Stack(
          children: [
            Container(
                height: 100,
                width: 100,
                child: Image.asset(circles[numberofDontShootFigure])),
          ],
        ),
      ),
    );
  }
}
