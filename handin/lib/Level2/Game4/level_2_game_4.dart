import 'dart:math';
import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:intl/intl.dart';
import 'package:fairytales/Menus/submenu2.dart';
import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'wrongFigures.dart';
import 'correctFigure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Level2Game4 extends StatefulWidget {
  @override
  _Level2Game4 createState() => _Level2Game4();
}

bool callFigure = false;
CollectionReference game2_4 = FirebaseFirestore.instance.collection('Game8');

class _Level2Game4 extends State<Level2Game4> {
  DateTime now = DateTime.now();
  static int numberInRow = 11;
  bool goneLeft = false;
  int numberOfSquares = numberInRow * 17;
  int gubbi = numberInRow * 15 + 1;
  String direction = "right";
  int rightfig1 = numberInRow + 1 + random.nextInt(4);
  int score = 0;

  int wrongfig1 = numberInRow + 6 + random.nextInt(4);
  int wrongfig2 = numberInRow + 133 + random.nextInt(7);
  String wrongFigureDirection1 = "left";
  String wrongFigureDirection2 = "right";
  String rightFigureDirection1 = "right";
  bool lastWasLeft;
  bool gameStarted = false;
  List<int> food = [];

  void getFood() {
    for (int i = 0; i < numberOfSquares; i++) {
      if (!barriers3.contains(i)) {
        food.add(i);
      }
    }
  }

  void playGame() {
    getFood();

    playMusic();
    gameStarted = true;
    moveRight1();
    moveWrong1();
    moveWrong2();
    calledFigure();
    callFigure = true;
    Duration duration = Duration(milliseconds: 110);
    Timer.periodic(duration, (timer) {
      if (food.contains(gubbi)) {
        food.remove(gubbi);
      }
      if (food.isEmpty) {
        timer.cancel();
        _showDialogFinished();
      }

      switch (direction) {
        case "left":
          goLeft();
          break;
        case "right":
          goRight();
          break;
        case "up":
          goUp();
          break;
        case "down":
          goDown();
          break;
      }

      void gameOver() {
        timer.cancel();
        _showDialog();
      }

      void eaten() {
        if (gubbi == rightfig1) {
          setState(() {
            rightfig1 = rightfig1;
            wrongfig1 = rightfig1;
            wrongfig2 = wrongfig2;
          });
          scorePoint();
        }
        if (gubbi == wrongfig1) {
          gameOver();
        }
        if (gubbi == wrongfig2) {
          gameOver();
        }
      }

      eaten();
    });
  }

  void _showDialog() {
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
                      game2_4.add({
                        "month": month,
                        "date": formattedDate,
                        "usertype": privateuser,
                        "email": email,
                        "points": score,
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SubMenu2()),
                      );
                    })
              ]);
        });
  }

  void _showDialogFinished() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.grey[700],
              title: Center(
                  child: Text(
                "Tillykke, du kom igennem",
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
                      'Jaaaaah!',
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
                      game2_4.add({
                        "month": month,
                        "date": formattedDate,
                        "usertype": privateuser,
                        "email": email,
                        "points": score,
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SubMenu2()),
                      );
                    })
              ]);
        });
  }

  void scorePoint() {
    setState(() {
      score += 8;
    });
  }

  void calledFigure() {
    setState(() {
      callFigure = true;
    });
  }

  void goLeft() {
    if (!barriers3.contains(gubbi - 1)) {
      setState(() {
        gubbi--;
      });
    }
  }

  void goRight() {
    if (!barriers3.contains(gubbi + 1)) {
      setState(() {
        gubbi++;
      });
    }
  }

  void goUp() {
    if (!barriers3.contains(gubbi - numberInRow)) {
      setState(() {
        gubbi -= numberInRow;
      });
    }
  }

  void goDown() {
    if (!barriers3.contains(gubbi + numberInRow)) {
      setState(() {
        gubbi += numberInRow;
      });
    }
  }

  void directionLeft() {
    lastWasLeft = true;
    setState(() {
      direction = "left";
    });
  }

  void directionRight() {
    lastWasLeft = false;
    setState(() {
      direction = "right";
    });
  }

  void directionUp() {
    setState(() {
      direction = "up";
    });
  }

  void directionDown() {
    setState(() {
      direction = "down";
    });
  }

  void moveWrong1() {
    Duration ghostSpeed = Duration(milliseconds: 500);
    Timer.periodic(ghostSpeed, (timer) {
      if (!barriers3.contains(wrongfig1 - 1) &&
          wrongFigureDirection1 != "right") {
        wrongFigureDirection1 = "left";
      } else if (!barriers3.contains(wrongfig1 - numberInRow) &&
          wrongFigureDirection1 != "down") {
        wrongFigureDirection1 = "up";
      } else if (!barriers3.contains(wrongfig1 + numberInRow) &&
          wrongFigureDirection1 != "up") {
        wrongFigureDirection1 = "down";
      } else if (!barriers3.contains(wrongfig1 + 1) &&
          wrongFigureDirection1 != "left") {
        wrongFigureDirection1 = "right";
      }

      switch (wrongFigureDirection1) {
        case "right":
          setState(() {
            wrongfig1++;
          });
          break;

        case "up":
          setState(() {
            wrongfig1 -= numberInRow;
          });
          break;

        case "left":
          setState(() {
            wrongfig1--;
          });
          break;

        case "down":
          setState(() {
            wrongfig1 += numberInRow;
          });
          break;
      }
    });
  }

  void moveWrong2() {
    Duration ghostSpeed = Duration(milliseconds: 500);
    Timer.periodic(ghostSpeed, (timer) {
      if (!barriers3.contains(wrongfig2 - 1) &&
          wrongFigureDirection2 != "right") {
        wrongFigureDirection2 = "left";
      } else if (!barriers3.contains(wrongfig2 - numberInRow) &&
          wrongFigureDirection2 != "down") {
        wrongFigureDirection2 = "up";
      } else if (!barriers3.contains(wrongfig2 + numberInRow) &&
          wrongFigureDirection2 != "up") {
        wrongFigureDirection2 = "down";
      } else if (!barriers3.contains(wrongfig2 + 1) &&
          wrongFigureDirection2 != "left") {
        wrongFigureDirection2 = "right";
      }

      switch (wrongFigureDirection2) {
        case "right":
          setState(() {
            wrongfig2++;
          });
          break;

        case "up":
          setState(() {
            wrongfig2 -= numberInRow;
          });
          break;

        case "left":
          setState(() {
            wrongfig2--;
          });
          break;

        case "down":
          setState(() {
            wrongfig2 += numberInRow;
          });
          break;
      }
    });
  }

  void moveRight1() {
    Duration ghostSpeed = Duration(milliseconds: 500);
    Timer.periodic(ghostSpeed, (timer) {
      if (!barriers3.contains(rightfig1 - 1) &&
          rightFigureDirection1 != "right") {
        rightFigureDirection1 = "left";
      } else if (!barriers3.contains(rightfig1 - numberInRow) &&
          rightFigureDirection1 != "down") {
        rightFigureDirection1 = "up";
      } else if (!barriers3.contains(rightfig1 + numberInRow) &&
          rightFigureDirection1 != "up") {
        rightFigureDirection1 = "down";
      } else if (!barriers3.contains(rightfig1 + 1) &&
          rightFigureDirection1 != "left") {
        rightFigureDirection1 = "right";
      }

      switch (rightFigureDirection1) {
        case "right":
          setState(() {
            rightfig1++;
          });
          break;

        case "up":
          setState(() {
            rightfig1 -= numberInRow;
          });
          break;

        case "left":
          setState(() {
            rightfig1--;
          });
          break;

        case "down":
          setState(() {
            rightfig1 += numberInRow;
          });
          break;
      }
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
            Icon(
              Icons.change_history,
              size: 40,
              color: Colors.white,
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
              game2_4.add({
                "month": month,
                "date": formattedDate,
                "usertype": privateuser,
                "email": email,
                "points": score,
              });
              stopMusic();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubMenu2()),
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
              child: Stack(children: [
                Container(
                    child: GridView.builder(
                        itemCount: numberOfSquares,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: numberInRow),
                        itemBuilder: (BuildContext context, int index) {
                          if (gubbi == index) {
                            switch (direction) {
                              case "left":
                                if (lastWasLeft == true) {
                                  return GubbiLeft();
                                } else {
                                  return Gubbi();
                                }
                                break;
                              case "right":
                                return Gubbi();
                                break;
                              case "down":
                                if (lastWasLeft == true) {
                                  return GubbiLeft();
                                } else {
                                  return Gubbi();
                                }

                                break;
                              case "up":
                                if (lastWasLeft == true) {
                                  return GubbiLeft();
                                } else {
                                  return Gubbi();
                                }
                                break;
                              default:
                                return Gubbi();
                            }
                          } else if (rightfig1 == index) {
                            return RightFigure();
                          } else if (wrongfig2 == index) {
                            return WrongFig2();
                          } else if (wrongfig1 == index) {
                            return WrongFig1();
                          } else if (barriers3.contains(index)) {
                            return Pixel(
                              color: darkBlueColor,
                              //child: Text(index.toString()),
                            );
                          } else if (food.contains(index) || !gameStarted) {
                            return Dots(
                              outercolor: transparent,
                              innercolor: purpleColor,
                              //child: Text(index.toString()),
                            );
                          } else {
                            return Dots();
                          }
                        }),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("asset/bubbleTrouble_4.png"),
                        fit: BoxFit.fill,
                      ),
                    )),
              ])),
          Expanded(
              child: Column(children: [
            Container(
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
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons(
                    icon: Icons.play_arrow,
                    function: playGame,
                  ),
                  Buttons(
                    icon: Icons.keyboard_arrow_left,
                    function: directionLeft,
                  ),
                  Buttons(
                    icon: Icons.keyboard_arrow_up,
                    function: directionUp,
                  ),
                  Buttons(
                    icon: Icons.keyboard_arrow_right,
                    function: directionRight,
                  ),
                  Buttons(
                    icon: Icons.keyboard_arrow_down,
                    function: directionDown,
                  ),
                ],
              ),
            ),
          ]))
        ],
      ),
    );
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
  assetsAudioPlayer.open(Audio("asset/audio/help4.mp3"));
}
