import 'package:fairytales/Menus/submenu1.dart';
import 'package:fairytales/Quiz_1/question1.dart';
import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:flutter/services.dart';

class QuizzenScroll1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      SizedBox(height: 20),
      Quizzen(),
      SizedBox(height: 20),
      SizedBox(height: 20),
    ]);
  }
}

class Quizzen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: purpleColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.emoji_symbols,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              Text(
                "Quiz tid",
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
                Icons.close,
                size: 20,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubMenu1()),
                );
              },
            ),
          ),
          backgroundColor: purpleColor,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/submenu1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: QuizzenScroll1()));
  }
}

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
              final prefs = await SharedPreferences.getInstance();
              prefs.setInt('Quiz', 1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question1()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Start Quizzen',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.play_circle_filled,
              size: 40,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: orangeColor,
            color: purpleColor,
          ),
        ),
      ],
    );
  }
}
