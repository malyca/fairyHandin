import 'package:fairytales/Globals/globalvariables.dart';
import 'package:fairytales/Menus/submenu1.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Confirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => SubMenu1())));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: new AppBar(
              title: Text(
                "Tillykke",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: buttonText,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              ),
              leading: new Container(),
              backgroundColor: purpleColor,
            ),
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/submenu1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    QuestionClass(),
                    SizedBox(height: 30),
                    Firework(),
                    SizedBox(height: 20),
                  ],
                ))));
  }
}

class QuestionClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20),
        Text(
          "Jaaaaaah",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: buttonText,
            color: Colors.white,
            fontFamily: "Montserrat",
          ),
        ),
      ],
    );
  }
}

class Firework extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        alignment: Alignment(0, 0),
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/firework.gif'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ]);
  }
}
