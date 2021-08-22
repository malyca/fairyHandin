import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fairytales/Globals/globalvariables.dart';
import 'level_3_game_2.dart';

Random random = new Random();

int numberofDontShootFigure = 0;

class DontShootThis extends StatelessWidget {
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
                height: 50,
                width: 50,
                child: Image.asset(triangles[numberofDontShootFigure])),
          ],
        ),
      ),
    );
  }
}

class DontShootThisToo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (callDontshootFigure_2 == false) {
      numberofDontShootFigure = random.nextInt(20);
      callDontshootFigure_2 = true;
    }
    return Container(
      child: Container(
        child: Stack(
          children: [
            Container(
                height: 50,
                width: 50,
                child: Image.asset(pentagon[numberofDontShootFigure])),
          ],
        ),
      ),
    );
  }
}
