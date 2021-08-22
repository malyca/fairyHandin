import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:flutter/services.dart';

class AquariumScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      SizedBox(height: 20),
      //TextFieldNumeric(),
      SizedBox(height: 20),
      //Password(),
      SizedBox(height: 70),
      //NextButton(),
      SizedBox(height: 100),
    ]);
  }
}

class Aquarium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: yellowColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Dit akvarie",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: buttonText,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              ),
            ],
          ),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: orangeColor,
        ),
        body: AquariumScroll());
  }
}
