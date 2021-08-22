import 'package:fairytales/Level4/Game1/level_4_game_1.dart';
import 'package:fairytales/Level4/Game2/level_4_game_2.dart';
import 'package:fairytales/Level4/Game3/level_4_game_3.dart';
import 'package:fairytales/Level4/Game4/level_4_game_4.dart';
import 'package:fairytales/Level4/quizzen.dart';
import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../levelmenu.dart';

class SubMenu4Scroll extends StatelessWidget {
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
    ]);
  }
}

class SubMenu4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    resetVariables();
    return Scaffold(
        appBar: AppBar(
          shadowColor: greenColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.school,
                color: Colors.white,
                size: 40,
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
          backgroundColor: greenColor,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/submenu4.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SubMenu4Scroll()));
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
                MaterialPageRoute(builder: (context) => Flappy4()),
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
              color: Colors.white,
              size: 40,
            ),
            textColor: Colors.white,
            splashColor: greenColor,
            color: redColor,
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
            splashColor: redColor,
            color: yellowColor,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Level4Game3()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              ' ',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.bookmark,
              size: 40,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: yellowColor,
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
                MaterialPageRoute(builder: (context) => Level4Game4()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              ' ',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.crop_square,
              size: 40,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: blueColor,
            color: greenColor,
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
              if (prefs.getInt("quizzFour") == 1 &&
                  prefs.getString("quizzFourDay") == day &&
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
                prefs.setInt("quizzFour", 1);
                prefs.setString("quizzFourDay", day);
                prefs.setString("oldusername", prefs.getString("email"));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quizzen4()),
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
