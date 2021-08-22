import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';

import 'level_3_game_4.dart';

int numberofFigure = 0;

class WrongFig1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (callFigure == false) {
      numberofFigure = random.nextInt(20);
      callFigure = true;
    }
    return Image.asset(triangles[numberofFigure]);
  }
}

class WrongFig2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (callFigure == false) {
      numberofFigure = random.nextInt(20);
      callFigure = true;
    }

    return Image.asset(circles[numberofFigure]);
  }
}

class WrongFig3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (callFigure == false) {
      numberofFigure = random.nextInt(20);
      callFigure = true;
    }

    return Image.asset(triangles[numberofFigure]);
  }
}
