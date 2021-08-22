import 'package:fairytales/Level2/Game1/level_2_game_1.dart';
import 'package:fairytales/Level2/Game2/level_2_game_2.dart';
import 'package:fairytales/Level2/Game3/level_2_game_3.dart';
import 'package:fairytales/Level2/Game4/level_2_game_4.dart';
import 'package:fairytales/Level2/quizzen.dart';
import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../levelmenu.dart';

class SubMenu2Scroll extends StatelessWidget {
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

class SubMenu2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    resetVariables();
    return Scaffold(
        appBar: AppBar(
          shadowColor: yellowColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.wb_sunny,
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
          backgroundColor: Colors.yellow,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/submenu2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SubMenu2Scroll()));
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
                MaterialPageRoute(builder: (context) => Flappy2()),
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
                MaterialPageRoute(builder: (context) => Level2Game3()),
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
                MaterialPageRoute(builder: (context) => Level2Game4()),
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
              if (prefs.getInt("quizzTwo") == 1 &&
                  prefs.getString("quizzTwoDay") == day &&
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
                prefs.setInt("quizzTwo", 1);
                prefs.setString("quizzTwoDay", day);
                prefs.setString("oldusername", prefs.getString("email"));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quizzen2()),
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
