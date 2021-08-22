import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fairytales/Globals/landscapePortrait.dart';

import 'package:fairytales/Level1/Game1/wands.dart';
import 'package:fairytales/Menus/submenu1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:flutter/services.dart';

class Flappy1 extends StatefulWidget {
  @override
  _Flappy1State createState() => _Flappy1State();
}

CollectionReference gameResult_1_1 =
    FirebaseFirestore.instance.collection('Game1');

class _Flappy1State extends State<Flappy1> {
  static double shipYaxis = 0;
  int score = 0;
  double time = 0;
  double height = 0;
  double barrierOne = -0.4;
  double barrierTwo = 0;
  double barrierThree = 0.5;
  double barrierFour = 1;
  double wand = -0.7;
  double wand1 = 0.5;
  double wand2 = 0;
  bool music = true;
  bool callPause = true;
  bool soundsEnabled = false;

  final assetsAudioPlayer = AssetsAudioPlayer();
  Random random = new Random();
  DateTime now = DateTime.now();
  double initialHeight = shipYaxis;

  bool gamestarted = false;
  void jump() {
    time = 0;
    initialHeight = shipYaxis;
  }

  void setInitialValues() {
    setState(() {
      shipYaxis = 0;
      time = 0;
      height = 0;
      initialHeight = shipYaxis;
      barrierOne = -0.4;
      barrierTwo = 0;
      barrierThree = 0.5;
      barrierFour = 1;
      score = 0;
    });
  }

  int _start = 0;
  void startGame() {
    gamestarted = true;

    Timer.periodic(Duration(milliseconds: 100), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.2 * time;
      setState(() {
        shipYaxis = initialHeight - height;
      });
      setState(() {
        if (barrierOne < -1.1) {
          barrierOne += 2;
        } else {
          barrierOne -= 0.03;
        }
      });
      setState(() {
        if (barrierTwo < -1.1) {
          barrierTwo += 2;
        } else {
          barrierTwo -= 0.03;
        }
      });
      setState(() {
        if (barrierThree < -1.1) {
          barrierThree += 2;
        } else {
          barrierThree -= 0.03;
        }
      });
      setState(() {
        if (barrierFour < -1.1) {
          barrierFour += 2;
        } else {
          barrierFour -= 0.03;
        }
      });
      setState(() {
        if (wand < -1) {
          wand += 2;
        } else {
          wand -= 0.03;
        }
      });
      setState(() {
        if (wand1 < -1) {
          wand1 += 2;
        } else {
          wand1 -= 0.03;
        }
      });
      setState(() {
        if (wand2 < -1) {
          wand2 += 2;
        } else {
          wand2 -= 0.03;
        }
      });

      void pauseTimer() {
        if (timer != null) timer.cancel();
      }

      void unpauseTimer() {
        startGame();
      }

      TextEditingController _textFieldController = TextEditingController();
      void clearText() {
        _textFieldController.clear();
      }

      void gameOver() {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "Hov, det var ikke rigtigt",
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
                      'Øv',
                      style: TextStyle(
                        fontSize: buttonText,
                        color: Colors.black,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      int privateuser = prefs.getInt("privatbruger");
                      String email = prefs.getString("email");
                      int scoring = prefs.getInt("scoregame1");
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(now);
                      String month = DateFormat('MM').format(now);
                      gameResult_1_1
                          .add({
                            "month": month,
                            "date": formattedDate,
                            "Resultat": scoring,
                            "Brugertype": privateuser,
                            "email": email,
                          })
                          .then((value) => print("Game Added"))
                          .catchError(
                              (error) => print("Failed to add game: $error"));
                      prefs.remove("scoregame1");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubMenu1(),
                        ),
                      );
                    },
                  )
                ],
              );
            });
      }

      void showDialogue() {
        int firstvariable = easy[random.nextInt(4)];
        int secondvariable = easy[random.nextInt(4)];
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
                        scores();

                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setInt("scoregame1", score);
                        print(score);

                        unpauseTimer();
                        clearText();
                        Navigator.of(context).pop();
                      } else {
                        gameOver();
                        stopMusic();
                        timer.cancel();
                        setInitialValues();
                        gamestarted = false;
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              );
            });
      }

      void hitGround() {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "Hov, du ramte græsset",
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
                      'Øv',
                      style: TextStyle(
                        fontSize: buttonText,
                        color: Colors.black,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setInt("game_1_1", score);
                      int privateuser = prefs.getInt("privatbruger");
                      String email = prefs.getString("email");
                      int scoring = prefs.getInt("scoregame1");
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(now);
                      String month = DateFormat('MM').format(now);
                      gameResult_1_1
                          .add({
                            "month": month,
                            "date": formattedDate,
                            "Resultat": scoring,
                            "Brugertype": privateuser,
                            "email": email,
                          })
                          .then((value) => print("Game Added"))
                          .catchError(
                              (error) => print("Failed to add game: $error"));
                      prefs.remove("scoregame1");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubMenu1(),
                        ),
                      );
                    },
                  )
                ],
              );
            });
      }

      void hitWand() {
        if ((wand < -0.8 && wand > -0.9) &&
            (shipYaxis < -0.6 && shipYaxis > -0.8)) {
          pauseTimer();
          wand += 2;
          showDialogue();
        }
        if ((wand1 < -0.8 && wand1 > -0.9) &&
            (shipYaxis < -0.4 && shipYaxis > -0.6)) {
          pauseTimer();
          wand1 += 2;
          showDialogue();
        }
        if ((wand2 < -0.8 && wand2 > -0.9) &&
            (shipYaxis < 0.1 && shipYaxis > -0.1)) {
          pauseTimer();
          wand2 += 2;
          showDialogue();
        }
      }

      if (shipYaxis > 0.7 || shipYaxis < -2) {
        setState(() {
          stopMusic();
          timer.cancel();

          setInitialValues();
          hitGround();
          gamestarted = false;
        });
      }
      hitWand();
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
                "Flyv med piraterne",
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
                int privateuser = prefs.getInt("privatbruger");
                String email = prefs.getString("email");
                int scoring = prefs.getInt("scoregame1");
                String formattedDate = DateFormat('yyyy-MM-dd').format(now);
                String month = DateFormat('MM').format(now);
                gameResult_1_1
                    .add({
                      "month": month,
                      "date": formattedDate,
                      "Resultat": scoring,
                      "Brugertype": privateuser,
                      "email": email,
                    })
                    .then((value) => print("Game Added"))
                    .catchError((error) => print("Failed to add game: $error"));
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
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (gamestarted) {
                        jump();
                      } else {
                        playMusic();
                        startGame();
                      }
                    },
                    child: AnimatedContainer(
                      alignment: Alignment(-0.85, shipYaxis),
                      duration: Duration(milliseconds: 0),
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                        image:
                            new ExactAssetImage("asset/flappybackground.png"),
                        fit: BoxFit.cover,
                      )),
                      child: Ship(),
                    ),
                  ),
                  Container(
                    alignment: Alignment(0, -0.6),
                    child: gamestarted
                        ? Text("")
                        : Text(
                            "S T A R T",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Montserrat",
                                color: Colors.white),
                          ),
                  ),
                  Container(
                    alignment: Alignment(-0.95, -0.95),
                    child: Text(
                      "P O I N T : " + score.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Montserrat",
                          color: Colors.black),
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierOne, 0.2),
                    duration: Duration(milliseconds: 0),
                    child: Barriers(
                      size: 130.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierTwo, 0.15),
                    duration: Duration(milliseconds: 0),
                    child: Barriers(
                      size: 150.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierThree, 0.3),
                    duration: Duration(milliseconds: 0),
                    child: Barriers(
                      size: 100.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierFour, 0.3),
                    duration: Duration(milliseconds: 0),
                    child: Barriers(
                      size: 100.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(wand, -0.7),
                    duration: Duration(milliseconds: 0),
                    child: Wand(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(wand1, -0.5),
                    duration: Duration(milliseconds: 0),
                    child: Wand(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(wand2, 0.0),
                    duration: Duration(milliseconds: 0),
                    child: Wand(),
                  )
                ],
              ),
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
  assetsAudioPlayer.open(Audio("asset/audio/help1.mp3"));
}
