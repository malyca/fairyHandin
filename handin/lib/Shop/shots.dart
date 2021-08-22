import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

double shooterHeight = 70;
double shooterWidth = 70;
String blueImage = "asset/shopitems/blueShooter.png";
String greenImage = "asset/shopitems/greenShooter.png";
String pinkImage = "asset/shopitems/pinkShooter.png";
String orangeImage = "asset/shopitems/orangeShooter.png";
String redImage = "asset/shopitems/redShooter.png";
String purpleImage = "asset/shopitems/purpleShooter.png";

class BlueShooter extends StatelessWidget {
  final function;
  BlueShooter({this.function});
  @override
  Widget build(BuildContext context) {
    blueItemBought();
    return GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
            height: shooterHeight,
            width: shooterWidth,
            child: Image.asset(blueImage)));
  }
}

void blueItemBought() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList("ShopItems") != null) {
    if (prefs.getStringList("ShopItems").contains("blue") ||
        prefs.getInt('Bllue') == 1) {
      blueImage = "asset/shopitems/blueShooterBought.png";
    }
  } else {
    blueImage = 'asset/shopitems/blueShooter.png';
  }
}

class GreenShooter extends StatelessWidget {
  final function;
  GreenShooter({this.function});
  @override
  Widget build(BuildContext context) {
    greenItemBought();
    return GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
            height: shooterHeight,
            width: shooterWidth,
            child: Image.asset(greenImage)));
  }
}

void greenItemBought() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList("ShopItems") != null) {
    if (prefs.getStringList("ShopItems").contains("green") ||
        prefs.getInt('Green') == 1) {
      greenImage = "asset/shopitems/greenShooterBought.png";
    }
  } else {
    greenImage = 'asset/shopitems/greenShooter.png';
  }
}

class OrangeShooter extends StatelessWidget {
  final function;
  OrangeShooter({this.function});
  @override
  Widget build(BuildContext context) {
    orangeItemBought();
    return GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
            height: shooterHeight,
            width: shooterWidth,
            child: Image.asset(orangeImage)));
  }
}

void orangeItemBought() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList("ShopItems") != null) {
    if (prefs.getStringList("ShopItems").contains("orange") ||
        prefs.getInt('Orange') == 1) {
      orangeImage = "asset/shopitems/orangeShooterBought.png";
    }
  } else {
    orangeImage = 'asset/shopitems/orangeShooter.png';
  }
}

class PinkShooter extends StatelessWidget {
  final function;

  PinkShooter({this.function});
  @override
  Widget build(BuildContext context) {
    pinkItemBought();
    return GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
            height: shooterHeight,
            width: shooterWidth,
            child: Image.asset(pinkImage)));
  }
}

void pinkItemBought() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList("ShopItems") != null) {
    if (prefs.getStringList("ShopItems").contains("pink") ||
        prefs.getInt('Pink') == 1) {
      pinkImage = "asset/shopitems/pinkShooterBought.png";
    }
  } else {
    pinkImage = 'asset/shopitems/pinkShooter.png';
  }
}

class PurpleShooter extends StatelessWidget {
  final function;
  PurpleShooter({this.function});
  @override
  Widget build(BuildContext context) {
    purpleItemBought();
    return GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
            height: shooterHeight,
            width: shooterWidth,
            child: Image.asset(purpleImage)));
  }
}

void purpleItemBought() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList("ShopItems") != null) {
    if (prefs.getStringList("ShopItems").contains("purple") ||
        prefs.getInt('Purple') == 1) {
      purpleImage = "asset/shopitems/purpleShooterBought.png";
    }
  } else {
    purpleImage = 'asset/shopitems/purpleShooter.png';
  }
}

class RedShooter extends StatelessWidget {
  final function;
  RedShooter({this.function});
  @override
  Widget build(BuildContext context) {
    redItemBought();
    return GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
            height: shooterHeight,
            width: shooterWidth,
            child: Image.asset(redImage)));
  }
}

void redItemBought() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList("ShopItems") != null) {
    if (prefs.getStringList("ShopItems").contains("red") ||
        prefs.getInt('Red') == 1) {
      redImage = "asset/shopitems/redShooterBought.png";
    }
  } else {
    redImage = 'asset/shopitems/redShooter.png';
  }
}
