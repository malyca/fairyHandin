import 'dart:math';

import 'package:flutter/material.dart';

const greenColor = Color(0xff33cc00);
const yellowColor = Color(0xffcccc00);
const redColor = Color(0xffcc0000);
const blueColor = Color(0xff0099cc);
const purpleColor = Color(0xff800080);
const pinkColor = Color(0xffcc0099);
const orangeColor = Color(0xffff8c1a);
const darkBlueColor = Color(0xff002699);
const lightBlueColor = Color(0xffccf2ff);
const transparent = Color(0x00000000);

const explainerTexts = 12.0;
const smallTexts = 15.0;

const buttonText = 20.0;
const mediumTexts = 25.0;

const largeTexts = 35.0;

String username = "";

List<int> easy = [1, 2, 3, 4, 5];
List<int> easyPlus = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

List<int> medium = [3, 4, 5, 6, 7, 8, 9];
List<int> hard = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0];

List<int> easyTimes = [1, 2, 3];

List<int> scale1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
List<int> scale2 = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20];
List<int> scale3 = [3, 6, 9, 12, 15, 18, 21, 24, 27, 30];
List<int> scale4 = [4, 8, 12, 16, 20, 24, 28, 32, 36, 40];
List<int> scale5 = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50];
List<int> scale6 = [6, 12, 18, 24, 30, 36, 42, 48, 54, 60];
List<int> scale7 = [7, 14, 21, 28, 35, 42, 49, 56, 63, 70];
List<int> scale8 = [8, 16, 24, 32, 40, 48, 56, 64, 72, 80];
List<int> scale9 = [9, 18, 27, 36, 45, 54, 63, 72, 81, 90];

List<String> triangles = [
  "asset/figures/3_1.png",
  "asset/figures/3_2.png",
  "asset/figures/3_3.png",
  "asset/figures/3_4.png",
  "asset/figures/3_5.png",
  "asset/figures/3_6.png",
  "asset/figures/3_7.png",
  "asset/figures/3_8.png",
  "asset/figures/3_9.png",
  "asset/figures/3_10.png",
  "asset/figures/3_11.png",
  "asset/figures/3_12.png",
  "asset/figures/3_13.png",
  "asset/figures/3_14.png",
  "asset/figures/3_15.png",
  "asset/figures/3_16.png",
  "asset/figures/3_17.png",
  "asset/figures/3_18.png",
  "asset/figures/3_19.png",
  "asset/figures/3_20.png",
  "asset/figures/3_21.png",
];

List<String> squares = [
  "asset/figures/4_1.png",
  "asset/figures/4_2.png",
  "asset/figures/4_3.png",
  "asset/figures/4_4.png",
  "asset/figures/4_5.png",
  "asset/figures/4_6.png",
  "asset/figures/4_7.png",
  "asset/figures/4_8.png",
  "asset/figures/4_9.png",
  "asset/figures/4_10.png",
  "asset/figures/4_11.png",
  "asset/figures/4_12.png",
  "asset/figures/4_13.png",
  "asset/figures/4_14.png",
  "asset/figures/4_15.png",
  "asset/figures/4_16.png",
  "asset/figures/4_17.png",
  "asset/figures/4_18.png",
  "asset/figures/4_19.png",
  "asset/figures/4_20.png",
  "asset/figures/4_21.png",
];

List<String> pentagon = [
  "asset/figures/5_1.png",
  "asset/figures/5_2.png",
  "asset/figures/5_3.png",
  "asset/figures/5_4.png",
  "asset/figures/5_5.png",
  "asset/figures/5_6.png",
  "asset/figures/5_7.png",
  "asset/figures/5_8.png",
  "asset/figures/5_9.png",
  "asset/figures/5_10.png",
  "asset/figures/5_11.png",
  "asset/figures/5_12.png",
  "asset/figures/5_13.png",
  "asset/figures/5_14.png",
  "asset/figures/5_15.png",
  "asset/figures/5_16.png",
  "asset/figures/5_17.png",
  "asset/figures/5_18.png",
  "asset/figures/5_19.png",
  "asset/figures/5_20.png",
  "asset/figures/5_21.png",
];

List<String> hexagon = [
  "asset/figures/6_1.png",
  "asset/figures/6_2.png",
  "asset/figures/6_3.png",
  "asset/figures/6_4.png",
  "asset/figures/6_5.png",
  "asset/figures/6_6.png",
  "asset/figures/6_7.png",
  "asset/figures/6_8.png",
  "asset/figures/6_9.png",
  "asset/figures/6_10.png",
  "asset/figures/6_11.png",
  "asset/figures/6_12.png",
  "asset/figures/6_13.png",
  "asset/figures/6_14.png",
  "asset/figures/6_15.png",
  "asset/figures/6_16.png",
  "asset/figures/6_17.png",
  "asset/figures/6_18.png",
  "asset/figures/6_19.png",
  "asset/figures/6_20.png",
  "asset/figures/6_21.png",
];

List<String> circles = [
  "asset/figures/O_1.png",
  "asset/figures/O_2.png",
  "asset/figures/O_3.png",
  "asset/figures/O_4.png",
  "asset/figures/O_5.png",
  "asset/figures/O_6.png",
  "asset/figures/O_7.png",
  "asset/figures/O_8.png",
  "asset/figures/O_9.png",
  "asset/figures/O_10.png",
  "asset/figures/O_11.png",
  "asset/figures/O_12.png",
  "asset/figures/O_13.png",
  "asset/figures/O_14.png",
  "asset/figures/O_15.png",
  "asset/figures/O_16.png",
  "asset/figures/O_17.png",
  "asset/figures/O_18.png",
  "asset/figures/O_19.png",
  "asset/figures/O_20.png",
  "asset/figures/O_21.png",
];

List<String> music = [
  "asset/audio/bensound-buddy.mp3",
  "asset/audio/bensound-creepy.mp3",
  "asset/audio/bensound-cute.mp3",
  "asset/audio/bensound-funnysong.mp3",
  "asset/audio/bensound-hey.mp3",
  "asset/audio/bensound-smile.mp3",
  "asset/audio/bensound-ukulele.mp3",
  "asset/audio/RoyasSong.mp3",
];

class TextForMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Musik fra Bensound.com',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontFamily: "Montserrat",
          ),
        ),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  static bool holdButton = false;

  final icon;
  final function;
  Buttons({this.icon, this.function});

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

class Ship extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60, width: 60, child: Image.asset('asset/Ship.png'));
  }
}

class Barriers extends StatelessWidget {
  final size;

  Barriers({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
          image: new DecorationImage(
        image: new ExactAssetImage("asset/tree.png"),
      )),
    );
  }
}

Random random = new Random();
int numberofFigure = 0;

class DontCatchSquares extends StatelessWidget {
  final figurex;
  final figurey;

  DontCatchSquares({this.figurex, this.figurey});

  @override
  Widget build(BuildContext context) {
    numberofFigure = random.nextInt(20);

    return Container(
      child: Container(
          height: 100, width: 100, child: Image.asset(squares[numberofFigure])),
    );
  }
}

class DontCatchPentagons extends StatelessWidget {
  final figurex;
  final figurey;

  DontCatchPentagons({this.figurex, this.figurey});

  @override
  Widget build(BuildContext context) {
    numberofFigure = random.nextInt(20);

    return Container(
      child: Container(
          height: 100,
          width: 100,
          child: Image.asset(pentagon[numberofFigure])),
    );
  }
}

class DontCatchCircles extends StatelessWidget {
  final figurex;
  final figurey;

  DontCatchCircles({this.figurex, this.figurey});

  @override
  Widget build(BuildContext context) {
    numberofFigure = random.nextInt(20);

    return Container(
      child: Container(
          height: 100, width: 100, child: Image.asset(circles[numberofFigure])),
    );
  }
}

class DontCatchTriangles extends StatelessWidget {
  final figurex;
  final figurey;

  DontCatchTriangles({this.figurex, this.figurey});

  @override
  Widget build(BuildContext context) {
    numberofFigure = random.nextInt(20);

    return Container(
      child: Container(
          height: 100,
          width: 100,
          child: Image.asset(triangles[numberofFigure])),
    );
  }
}

class DontCatchHexagons extends StatelessWidget {
  final figurex;
  final figurey;

  DontCatchHexagons({this.figurex, this.figurey});

  @override
  Widget build(BuildContext context) {
    numberofFigure = random.nextInt(20);

    return Container(
      child: Container(
          height: 100, width: 100, child: Image.asset(hexagon[numberofFigure])),
    );
  }
}

List<int> barriers = [
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  22,
  33,
  44,
  55,
  66,
  77,
  88,
  99,
  110,
  121,
  132,
  143,
  154,
  165,
  176,
  177,
  178,
  179,
  180,
  181,
  182,
  183,
  184,
  185,
  186,
  21,
  32,
  43,
  54,
  65,
  76,
  87,
  98,
  109,
  120,
  131,
  142,
  153,
  164,
  175
];
List<int> barriers1 = [
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  22,
  33,
  44,
  55,
  66,
  77,
  88,
  99,
  110,
  121,
  132,
  143,
  154,
  165,
  176,
  177,
  178,
  179,
  180,
  181,
  182,
  183,
  184,
  185,
  186,
  21,
  32,
  43,
  54,
  65,
  76,
  87,
  98,
  109,
  120,
  131,
  142,
  153,
  164,
  175
];
List<int> barriers2 = [
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  22,
  33,
  44,
  55,
  66,
  77,
  88,
  99,
  110,
  121,
  132,
  143,
  154,
  165,
  176,
  177,
  178,
  179,
  180,
  181,
  182,
  183,
  184,
  185,
  186,
  21,
  32,
  43,
  54,
  65,
  76,
  87,
  98,
  109,
  120,
  131,
  142,
  153,
  164,
  175
];
List<int> barriers3 = [
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  22,
  33,
  44,
  55,
  66,
  77,
  88,
  99,
  110,
  121,
  132,
  143,
  154,
  165,
  176,
  177,
  178,
  179,
  180,
  181,
  182,
  183,
  184,
  185,
  186,
  21,
  32,
  43,
  54,
  65,
  76,
  87,
  98,
  109,
  120,
  131,
  142,
  153,
  164,
  175,
  133,
  134,
  135,
  139,
  140,
  141,
  169,
  171,
  156,
  162,
  137,
  126,
  115,
  104,
  93,
  71,
  60,
  49,
  38,
  27,
  16,
  114,
  113,
  112,
  101,
  90,
  79,
  68,
  57,
  46,
  35,
  24,
  116,
  117,
  118,
  107,
  96,
  85,
  74,
  63,
  52,
  41,
  30,
  92,
  93,
  94,
  26,
  47,
  70,
  72,
  51,
  28
];
List<int> barriers4 = [
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  22,
  33,
  44,
  55,
  66,
  77,
  88,
  99,
  110,
  121,
  132,
  143,
  154,
  165,
  176,
  177,
  178,
  179,
  180,
  181,
  182,
  183,
  184,
  185,
  186,
  21,
  32,
  43,
  54,
  65,
  76,
  87,
  98,
  109,
  120,
  131,
  142,
  153,
  164,
  175,
  168,
  157,
  146,
  135,
  124,
  113,
  114,
  115,
  116,
  105,
  94,
  83,
  18,
  29,
  40,
  14,
  25,
  36,
  152,
  89,
  90,
  47,
  58,
];

class Dots extends StatelessWidget {
  final innercolor;
  final outercolor;
  final child;

  Dots({this.innercolor, this.outercolor, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(1.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
                padding: EdgeInsets.all(12),
                color: outercolor,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      padding: EdgeInsets.all(4),
                      color: innercolor,
                      child: Center(
                        child: child,
                      )),
                ))));
  }
}

class Pixel extends StatelessWidget {
  final color;
  final child;

  Pixel({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
            color: color,
            child: Center(
              child: child,
            )));
  }
}

class Gubbi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('asset/gubbiClosed.png');
  }
}

class GubbiLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('asset/gubbiClosedLeft.png');
  }
}

class JumpBlack extends StatelessWidget {
  final direction;

  JumpBlack({this.direction});
  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
          width: 70, height: 110, child: Image.asset("asset/jump.png"));
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
            width: 70, height: 110, child: Image.asset("asset/jump.png")),
      );
    }
  }
}

class Black extends StatelessWidget {
  final direction;
  final midrunning;

  Black({this.direction, this.midrunning});
  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: 60,
        height: 90,
        child: midrunning
            ? Image.asset("asset/standing.png")
            : Image.asset("asset/running.png"),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: 60,
          height: 90,
          child: midrunning
              ? Image.asset("asset/standing.png")
              : Image.asset("asset/running.png"),
        ),
      );
    }
  }
}

class JumpPurple extends StatelessWidget {
  final direction;

  JumpPurple({this.direction});
  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
          width: 80, height: 130, child: Image.asset("asset/purpleJump.png"));
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
            width: 80, height: 130, child: Image.asset("asset/purpleJump.png")),
      );
    }
  }
}

class Purple extends StatelessWidget {
  final direction;
  final midrunning;

  Purple({this.direction, this.midrunning});
  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: 60,
        height: 90,
        child: midrunning
            ? Image.asset("asset/purpleStand.png")
            : Image.asset("asset/purple.png"),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: 60,
          height: 90,
          child: midrunning
              ? Image.asset("asset/purpleStand.png")
              : Image.asset("asset/purple.png"),
        ),
      );
    }
  }
}
