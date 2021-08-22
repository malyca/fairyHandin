import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';

import 'level_1_game_4.dart';

int numberofFigure = 0;

class RightFigure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (callFigure == false) {
      numberofFigure = random.nextInt(20);
      callFigure = true;
    }

    return Image.asset(triangles[numberofFigure]);
  }
}
