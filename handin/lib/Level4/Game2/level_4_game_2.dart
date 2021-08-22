import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:fairytales/Menus/submenu4.dart';
import 'package:intl/intl.dart';
import 'buttons.dart';
import 'rightFigure.dart';
import 'wrongFigure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fairytales/Globals/globalvariables.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

CollectionReference game4_2 = FirebaseFirestore.instance.collection('Game14');
bool callDontshootFigure_1 = false;
bool callDontshootFigure_2 = false;
bool callshootFigure_1 = false;
DateTime now = DateTime.now();

class _HomePageState extends State<HomePage> {
  Random random = new Random();
  bool blackGameStart = false;
  bool musicStarted = false;

  static double rightFigurex = 1;
  static double wrongFigurex1 = 1.4;
  static double wrongFigurex2 = 1.7;
  static double blackx = -1.0;
  static double blacky = .3;
  static double time = 0;
  int score = 0;
  TextEditingController _textFieldController = TextEditingController();
  static double height = .2;
  double initialHeight = blacky;
  String direction = 'right';
  bool midrunning = false;
  bool jumping = false;
  void prejump() {
    time = 0;
    initialHeight = blacky;
  }

  void playGame() {
    if (musicStarted == false) {
      playMusic();
      musicStarted = true;
    }
    if (blackGameStart == false) {
      blackGameStart = true;
      Timer.periodic(Duration(milliseconds: 130), (timer) {
        void _showEndDialogue() {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    "Øv, det var ikke en firkant",
                    style: TextStyle(
                      fontSize: buttonText,
                      color: Colors.black,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    new FlatButton(
                        child: new Text(
                          'Øv!',
                          style: TextStyle(
                            fontSize: buttonText,
                            color: Colors.black,
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
                          game4_2.add({
                            "month": month,
                            "date": formattedDate,
                            "usertype": privateuser,
                            "email": email,
                            "points": score,
                          });
                          setInitialValues();
                          musicStarted = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubMenu4(),
                            ),
                          );
                        })
                  ],
                );
              });
        }

        void gameOver() {
          _showEndDialogue();
          timer.cancel();
        }

        void pauseTimer() {
          if (timer != null) timer.cancel();
        }

        void unpauseTimer() {
          blackGameStart = false;
          playGame();
        }

        void _showDialogue() {
          int firstvariable = hard[random.nextInt(12)];
          int secondvariable = hard[random.nextInt(12)];
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    firstvariable.toString() +
                        "+" +
                        secondvariable.toString() +
                        "=",
                    style: TextStyle(
                      fontSize: buttonText,
                      color: Colors.black,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  content: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    controller: _textFieldController,
                    decoration: InputDecoration(hintText: "Svar"),
                  ),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    new FlatButton(
                      child: new Text(
                        'Tjek',
                        style: TextStyle(
                          fontSize: buttonText,
                          color: Colors.black,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      onPressed: () async {
                        int result = firstvariable + secondvariable;
                        String resultString = result.toString();
                        if (resultString ==
                            _textFieldController.text.toString()) {
                          scorePoint();
                          unpauseTimer();
                          clearText();
                          Navigator.of(context).pop();
                        } else {
                          gameOver();
                          stopMusic();
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(now);
                          String month = DateFormat('MM').format(now);
                          int privateuser = prefs.getInt("privatbruger");
                          String email = prefs.getString("email");

                          game4_2.add({
                            "month": month,
                            "date": formattedDate,
                            "usertype": privateuser,
                            "email": email,
                            "points": score,
                          });
                          setInitialValues();
                          musicStarted = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubMenu4(),
                            ),
                          );
                        }
                      },
                    )
                  ],
                );
              });
        }

        void moveRightFigure() {
          setState(() {
            if ((blackx + 0.03 >= rightFigurex &&
                    blackx - 0.03 <= rightFigurex) &&
                (blacky == .3)) {
              rightFigurex = 1.2;

              scorePoint();
              pauseTimer();
              _showDialogue();
              callshootFigure_1 = false;
            }

            if (rightFigurex >= -1) {
              rightFigurex -= 0.05;
            } else {
              rightFigurex = 1.3;
              callshootFigure_1 = false;
            }
          });
        }

        void moveWrongFigure1() {
          setState(() {
            if ((blackx + 0.05 >= wrongFigurex1 &&
                    blackx - 0.05 <= wrongFigurex1) &&
                (blacky == .3)) {
              gameOver();
            }
            if (wrongFigurex1 >= -1) {
              wrongFigurex1 -= 0.03;
            } else {
              callDontshootFigure_1 = false;
              wrongFigurex1 = 1.4;
            }
          });
        }

        void moveWrongFigure2() {
          setState(() {
            if ((blackx + 0.1 >= wrongFigurex2 &&
                    blackx - 0.1 <= wrongFigurex2) &&
                (blacky == .3)) {
              gameOver();
            }
            if (wrongFigurex2 >= -1) {
              wrongFigurex2 -= 0.02;
            } else {
              callDontshootFigure_2 = false;
              wrongFigurex2 = 1.2;
            }
          });
        }

        moveRightFigure();
        moveWrongFigure1();
        moveWrongFigure2();
      });
    }
  }

  void setInitialValues() {
    blackGameStart = false;
    rightFigurex = 1;
    wrongFigurex1 = 1.4;
    wrongFigurex2 = 1.7;
    blackx = -1.0;
    blacky = .3;
    time = 0;
    score = 0;
  }

  void scorePoint() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      score += 15;
    });
  }

  void clearText() {
    _textFieldController.clear();
  }

  void jump() {
    jumping = true;
    prejump();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 5 * time;

      if (initialHeight - height > .2) {
        jumping = false;

        setState(() {
          blacky = .3;
        });
        timer.cancel();
      } else {
        setState(() {
          blacky = initialHeight - height;
        });
      }
    });
  }

  void moveRight() {
    direction = "right";

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (ButtonsGame2().playerHoldsButton() == true && blackx < 1) {
        setState(() {
          midrunning = !midrunning;
          blackx += 0.02;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void moveLeft() {
    direction = "left";
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (ButtonsGame2().playerHoldsButton() == true && blackx > -1) {
        //insert the movement of blocks instead of blackx
        setState(() {
          midrunning = !midrunning;
          blackx -= 0.02;
        });
      } else {
        timer.cancel();
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
              Text(
                "Fang firkanten",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: buttonText,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              ),
              Icon(
                Icons.crop_square,
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
                game4_2.add({
                  "month": month,
                  "date": formattedDate,
                  "usertype": privateuser,
                  "email": email,
                  "points": score,
                });
                stopMusic();
                setInitialValues();
                musicStarted = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubMenu4()),
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
        body: Column(
          children: [
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Container(
                      child: AnimatedContainer(
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                            image: new ExactAssetImage(
                                "asset/JumpingBackground.png"),
                            fit: BoxFit.fill,
                          )),
                          duration: Duration(milliseconds: 0),
                          alignment: Alignment(blackx, blacky),
                          child: jumping
                              ? JumpPurple(
                                  direction: direction,
                                )
                              : Purple(
                                  direction: direction,
                                  midrunning: midrunning,
                                )),
                    ),
                    Container(
                      alignment: Alignment(rightFigurex, .2),
                      child: ShootThis(),
                    ),
                    Container(
                      alignment: Alignment(wrongFigurex1, .2),
                      child: DontShootThis(),
                    ),
                    Container(
                      alignment: Alignment(wrongFigurex2, .2),
                      child: DontShootThisToo(),
                    ),
                    Container(
                      alignment: Alignment(-0.95, -0.95),
                      child: Text(
                        "P O I N T: " + score.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Montserrat",
                            color: Colors.white),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(
                        icon: Icons.play_arrow,
                        function: playGame,
                      ),
                      ButtonsGame2(
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                          function: moveLeft),
                      ButtonsGame2(
                        child: Icon(
                          Icons.arrow_upward,
                          size: 30,
                          color: Colors.white,
                        ),
                        function: jump,
                      ),
                      ButtonsGame2(
                          child: Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: Colors.white,
                          ),
                          function: moveRight),
                    ],
                  )),
            ),
          ],
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
  assetsAudioPlayer.open(Audio("asset/audio/help2_2.mp3"));
}
