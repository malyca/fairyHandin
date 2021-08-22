import 'package:fairytales/Globals/globalvariables.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color colorshoot = Colors.black;

class Shooting extends StatelessWidget {
  final shootx;
  final shooty;

  Shooting({this.shootx, this.shooty});
  @override
  Widget build(BuildContext context) {
    getAColor();
    return Container(
      alignment: Alignment(shootx, 0.9),
      child: Container(
        width: 2,
        height: shooty,
        color: colorshoot,
      ),
    );
  }
}

void getAColor() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("Shooting") != null) {
    if (prefs.getString("Shooting") == "BlueShot") {
      colorshoot = blueColor;
    }
    if (prefs.getString("Shooting") == "BlueShot") {
      colorshoot = blueColor;
    }
    if (prefs.getString("Shooting") == "GreenShot") {
      colorshoot = greenColor;
    }
    if (prefs.getString("Shooting") == "OrangeShot") {
      colorshoot = orangeColor;
    }
    if (prefs.getString("Shooting") == "PinkShot") {
      colorshoot = pinkColor;
    }
    if (prefs.getString("Shooting") == "PurpleShot") {
      colorshoot = purpleColor;
    }
    if (prefs.getString("Shooting") == "RedShot") {
      colorshoot = redColor;
    }
  } else {
    colorshoot = Colors.black;
  }
}
