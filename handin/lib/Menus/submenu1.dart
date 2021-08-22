import 'package:fairytales/Level1/Game1/level_1_game_1.dart';
import 'package:fairytales/Level1/Game2/level_1_game_2.dart';

import 'package:fairytales/Level1/Game3/level_1_game_3.dart';
import 'package:fairytales/Level1/Game4/level_1_game_4.dart';
import 'package:fairytales/Level1/quizzen.dart';
import 'package:fairytales/levelmenu.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class SubMenu1Scroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      SizedBox(height: 20),
      LevelsButton1(),
      SizedBox(height: 20),
      LevelsButton2(),
      SizedBox(height: 20),
      Quizzen(),
      SizedBox(height: 50),
      TextForMusic()

      //NextButton(),
    ]);
  }
}

class SubMenu1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    resetVariables();
    return Scaffold(
        appBar: AppBar(
          shadowColor: redColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.extension,
                size: 40,
                color: Colors.white,
              ),
            ],
          ),
          leading: new Container(
            child: new FlatButton(
              child: new Icon(
                Icons.close,
                size: 20,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelMenu()),
                );
              },
            ),
          ),
          backgroundColor: redColor,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/submenu1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SubMenu1Scroll()));
  }
}

class LevelsButton1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTheme(
          minWidth: 100.0,
          height: 100.0,
          child: RaisedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Flappy1()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              ' ',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.directions_boat,
              size: 40,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: pinkColor,
            color: blueColor,
          ),
        ),
        SizedBox(width: 20),
        ButtonTheme(
          minWidth: 100.0,
          height: 100.0,
          child: RaisedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              ' ',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.wb_sunny,
              size: 40,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: yellowColor,
            color: greenColor,
          ),
        ),
      ],
    );
  }
}

class LevelsButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTheme(
          minWidth: 100.0,
          height: 100.0,
          child: RaisedButton.icon(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt("score1_3", 0);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Level1Game3Scroll()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              ' ',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.change_history,
              size: 40,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: purpleColor,
            color: orangeColor,
          ),
        ),
        SizedBox(width: 20),
        ButtonTheme(
          minWidth: 100.0,
          height: 100.0,
          child: RaisedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Level1Game4()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              ' ',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.change_history,
              size: 40,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: greenColor,
            color: redColor,
          ),
        ),
      ],
    );
  }
}

DateTime now = DateTime.now();

class Quizzen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTheme(
          minWidth: 100.0,
          height: 100.0,
          child: RaisedButton.icon(
            onPressed: () async {
              String day = DateFormat('DD').format(now);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if (prefs.getInt("quizzOne") == 1 &&
                  prefs.getString("quizzOneDay") == day &&
                  prefs.getString("email") == prefs.getString("oldusername")) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors.grey[700],
                          title: Center(
                              child: Text(
                            "Hov! Quizzen virker kun én gang om dagen",
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
                                onPressed: () {
                                  Navigator.of(context).pop();
                                })

                            //
                          ]);
                    });
              } else {
                prefs.setInt("quizzOne", 1);
                prefs.setString("quizzOneDay", day);
                prefs.setString("oldusername", prefs.getString("email"));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quizzen1()),
                );
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Quizzen',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.emoji_symbols,
              size: 40,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: pinkColor,
            color: purpleColor,
          ),
        ),
      ],
    );
  }
}

void resetVariables() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("score");
}
