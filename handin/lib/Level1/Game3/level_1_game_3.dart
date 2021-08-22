import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fairytales/Globals/landscapePortrait.dart';

import 'package:fairytales/Menus/submenu1.dart';
import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//Dateformat:
import 'package:intl/intl.dart';

import 'figures.dart';
import 'shoot.dart';
import 'dontshoot.dart';
import 'gubbi.dart';

class Level1Game3Scroll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Game3();
}

CollectionReference game1_3 = FirebaseFirestore.instance.collection('Game3');
bool callFigure = false;
bool callDontshootFigure = false;
bool callDontshootFigure_1 = false;
enum direction { LEFT, RIGHT }
enum directiondontshoot { LEFT, RIGHT }
enum directiondontshootThis { LEFT, RIGHT }
DateTime now = DateTime.now();

class _Game3 extends State<Level1Game3Scroll> {
  static double gubbix = 0;
  bool gameActive = false;
  bool cancelTimer = false;
  int score = 0;
  double shootx = gubbix;
  double figuresx = 0.5;
  double figuresy = -0.5;
  double dontshootfiguresx = 0.5;
  double dontshootfiguresy = -1;
  double dontshootfiguresy_1 = -0.5;
  double dontshootfiguresx_1 = 0.2;
  bool middleofshot = false;
  var figuresDirection = direction.LEFT;
  var figuresDirectionDontShoot = directiondontshoot.LEFT;
  var figuresDirectionDontShootThis = directiondontshootThis.LEFT;

  double heightShot = 10;

  void playGame() async {
    double time = 0;
    double heights = 0;
    double velocity = 75;
    if (gameActive == false) {
      playMusic();
      startDontshootFigure();
      startDontshootFigureThis();
      gameActive = true;
      Timer.periodic(Duration(milliseconds: 23), (timer) {
        heights = -5 * time * time + velocity * time;

        if (heights < 2) {
          time = 0;
        }
        setState(() {
          figuresy = heightCoordinate(heights);
        });
        time += 0.1;

        if (figuresx < -1) {
          figuresDirection = direction.RIGHT;
        } else if (figuresx > 1) {
          figuresDirection = direction.LEFT;
        }
        if (figuresDirection == direction.LEFT) {
          setState(() {
            figuresx -= 0.01;
          });
        } else {
          setState(() {
            figuresx += 0.03;
          });
        }
      });
    }
  }

  void startDontshootFigure() {
    double time = 0;
    double heights = 0;
    double velocity = 75;
    Timer.periodic(Duration(milliseconds: 20), (timer) {
      if (heights < 2) {
        time = 0;
      }
      setState(() {
        dontshootfiguresy = heightCoordinate(heights);
      });
      time += 0.1;
      heights = -5 * time * time + velocity * time;
      if (dontshootfiguresx < -1) {
        figuresDirectionDontShoot = directiondontshoot.RIGHT;
      } else if (dontshootfiguresx > 1) {
        figuresDirectionDontShoot = directiondontshoot.LEFT;
      }
      if (figuresDirectionDontShoot == directiondontshoot.LEFT) {
        setState(() {
          dontshootfiguresx -= 0.03;
        });
      } else {
        setState(() {
          dontshootfiguresx += 0.02;
        });
      }
      if (gameActive == false) {
        _showDialog();
        timer.cancel();
        gameActive = false;
      }
    });
  }

  void startDontshootFigureThis() {
    double time = 0;
    double heights = 0;
    double velocity = 75;
    Timer.periodic(Duration(milliseconds: 25), (timer) {
      if (heights < 2) {
        time = 0;
      }
      setState(() {
        dontshootfiguresy_1 = heightCoordinate(heights);
      });
      time += 0.1;
      heights = -5 * time * time + velocity * time;
      if (dontshootfiguresx_1 < -1) {
        figuresDirectionDontShootThis = directiondontshootThis.RIGHT;
      } else if (dontshootfiguresx_1 > 1) {
        figuresDirectionDontShootThis = directiondontshootThis.LEFT;
      }
      if (figuresDirectionDontShootThis == directiondontshootThis.LEFT) {
        setState(() {
          dontshootfiguresx_1 -= 0.01;
        });
      } else {
        setState(() {
          dontshootfiguresx_1 += 0.02;
        });
      }
      if (gameActive == false) {
        _showDialog();
        timer.cancel();
        gameActive = true;
      }
    });
  }

  void _showDialog() {
    CollectionReference game1_3 =
        FirebaseFirestore.instance.collection('Game3');
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.grey[700],
              title: Center(
                  child: Text(
                "Hov! Det var ikke en trekant",
                style: TextStyle(
                  fontSize: buttonText,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              )),
              actions: <Widget>[
                // ignore: deprecated_member_use
                new FlatButton(
                    child: new Text(
                      'Øv!',
                      style: TextStyle(
                        fontSize: buttonText,
                        color: Colors.white,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    onPressed: () async {
                      stopMusic();
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(now);
                      String month = DateFormat('MM').format(now);
                      int privateuser = prefs.getInt("privatbruger");
                      String email = prefs.getString("email");
                      game1_3.add({
                        "month": month,
                        "date": formattedDate,
                        "usertype": privateuser,
                        "email": email,
                        "points": score,
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SubMenu1()),
                      );
                    })
              ]);
        });
  }

  void moveLeft() {
    setState(() {
      if (!middleofshot) {
        shootx = gubbix;
      }
      if (gubbix < -1) {
      } else {
        gubbix -= 0.1;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (!middleofshot) {
        shootx = gubbix;
      }
      if (gubbix > 1) {
      } else {
        gubbix += 0.1;
      }
    });
  }

  void shoot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (middleofshot == false) {
      Timer.periodic(Duration(milliseconds: 20), (timer) {
        middleofshot = true;
        setState(() {
          heightShot += 10;
        });
        //How long can the shot go?
        if (heightShot > MediaQuery.of(context).size.height / 3) {
          timer.cancel();
          resetShot();
        }
        //check for hit
        if (figuresy > heightCoordinate(heightShot) &&
            (figuresx - shootx).abs() < 0.2) {
          scores();

          resetShot();
          callFigure = false;
          callDontshootFigure = false;
          callDontshootFigure_1 = false;

          figuresx = 2;
          timer.cancel();
        }

        if (dontshootfiguresy > heightDontShootCoordinate(heightShot) &&
            (dontshootfiguresx - shootx).abs() < 0.2) {
          gameActive = false;
          callDontshootFigure = false;
          dontshootfiguresx = 2;
        }
        if (dontshootfiguresy_1 > heightDontShootCoordinate_1(heightShot) &&
            (dontshootfiguresx_1 - shootx).abs() < 0.2) {
          gameActive = false;
          callDontshootFigure_1 = false;
          dontshootfiguresx = 2;
        }
      });
    }
  }

  //finding the position of the figure
  double heightCoordinate(double height) {
    double totalHeight = MediaQuery.of(context).size.height * 3 / 4;
    double figuresY = 1 - 3 * height / totalHeight;
    return figuresY;
  }

  double heightDontShootCoordinate(double height) {
    double totalHeight = MediaQuery.of(context).size.height * 3 / 4;
    double dontshootfiguresy = 1 - 2 * height / totalHeight;
    return dontshootfiguresy;
  }

  double heightDontShootCoordinate_1(double height) {
    double totalHeight = MediaQuery.of(context).size.height * 3 / 4;
    double dontshootfiguresy_1 = 1 - 2 * height / totalHeight;
    return dontshootfiguresy_1;
  }

  void resetShot() {
    setState(() {
      shootx = gubbix;
      heightShot = 10;
      middleofshot = false;
    });
  }

  void scores() {
    setState(() {
      score += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actionsIconTheme: IconThemeData(color: transparent),
          shadowColor: yellowColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Skyd trekanten",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: buttonText,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              ),
            ],
          ),
          leading: new Container(
            child: new FlatButton(
              child: new Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String formattedDate = DateFormat('yyyy-MM-dd').format(now);
                String month = DateFormat('MM').format(now);
                int privateuser = prefs.getInt("privatbruger");
                String email = prefs.getString("email");
                game1_3.add({
                  "month": month,
                  "date": formattedDate,
                  "usertype": privateuser,
                  "email": email,
                  "points": score,
                });
                stopMusic();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubMenu1()),
                );
              },
            ),
          ),
          actions: [
            Container(
              width: 30,
              child: new FlatButton(
                  child: new Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    playHelp();
                  }),
            ),
            Icon(Icons.more_vert),
          ],
          backgroundColor: darkBlueColor,
        ),
        backgroundColor: darkBlueColor,
        body: Column(
          children: [
            Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("asset/bubbleTrouble.png"),
                        fit: BoxFit.fill,
                      ),
                    )),
                    Container(
                      child: Container(
                        child: Shooting(
                          shootx: shootx,
                          shooty: heightShot,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment(figuresx, figuresy),
                      child: Figures(),
                    ),
                    Container(
                      alignment:
                          Alignment(dontshootfiguresx, dontshootfiguresy),
                      child: DontShoot(),
                    ),
                    Container(
                      alignment:
                          Alignment(dontshootfiguresx_1, dontshootfiguresy_1),
                      child: DontShootThis(),
                    ),
                    Container(
                      alignment: Alignment(gubbix, 1.1),
                      child: Container(
                        child: Shooter(),
                      ),
                    ),
                  ],
                )),
            Expanded(
                child: Container(
              alignment: Alignment(-1, -1),
              child: Container(
                child: Text(
                  "P O I N T : " + score.toString(),
                  style: TextStyle(
                    fontSize: buttonText,
                    color: Colors.white,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            )),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Buttons(
                      icon: Icons.play_arrow,
                      function: playGame,
                    ),
                    Buttons(
                      icon: Icons.keyboard_arrow_left,
                      function: moveLeft,
                    ),
                    Buttons(
                      icon: Icons.keyboard_arrow_up,
                      function: shoot,
                    ),
                    Buttons(
                      icon: Icons.keyboard_arrow_right,
                      function: moveRight,
                    ),
                  ],
                ),
              ),
            )
          ],

          //child: Level1Game4Scroll()
        ));
  }
}

final assetsAudioPlayer = AssetsAudioPlayer();

void playMusic() {
  Random random = new Random();
  String musicvariable = music[random.nextInt(7)];
  assetsAudioPlayer.open(
      Playlist(audios: [
        Audio(musicvariable),
      ]),
      loopMode: LoopMode.playlist);
}

void stopMusic() {
  assetsAudioPlayer.stop();
}

void playHelp() {
  assetsAudioPlayer.open(Audio("asset/audio/help7.mp3"));
}
