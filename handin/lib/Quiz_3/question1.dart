import 'package:fairytales/Quiz_3/question2.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionScroll1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      SizedBox(height: 40),
      Quizzen(),
      SizedBox(height: 40),
    ]);
  }
}

TextEditingController _textFieldController = TextEditingController();

Random random = new Random();

class Question1 extends StatelessWidget {
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
                "Spørgsmål 1",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: buttonText,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              ),
            ],
          ),
          leading: new Container(),
          backgroundColor: purpleColor,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/submenu3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: QuestionScroll1()));
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
          // ignore: deprecated_member_use
          child: RaisedButton.icon(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              int firstvariable = medium[random.nextInt(6)];
              int secondvariable = medium[random.nextInt(6)];
              showDialog(
                  barrierDismissible: false,
                  context: context,
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
                            print(resultString);
                            print(_textFieldController.text.toString());

                            if (resultString ==
                                _textFieldController.text.toString()) {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Du har svaret rigtig",
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
                                            'Jaaaaah',
                                            style: TextStyle(
                                              fontSize: buttonText,
                                              color: Colors.black,
                                              fontFamily: "Montserrat",
                                            ),
                                          ),
                                          onPressed: () async {
                                            prefs.setInt("quiz3Question1", 5);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Question2()),
                                            );
                                          },
                                        )
                                      ],
                                    );
                                  });

                              //Navigator.of(context).pop();
                            } else {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Av, det var forkert",
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
                                            'Neeeeej, svaret var: \n \n' +
                                                resultString,
                                            style: TextStyle(
                                              fontSize: buttonText,
                                              color: Colors.black,
                                              fontFamily: "Montserrat",
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          onPressed: () async {
                                            prefs.setInt("quiz3Question1", 0);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Question2()),
                                            );
                                          },
                                        )
                                      ],
                                    );
                                  });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Question2()),
                              );
                              Navigator.of(context).pop();
                            }
                          },
                        )
                      ],
                    );
                  });
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Spørsmål 1',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.help,
              size: 40,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: orangeColor,
            color: yellowColor,
          ),
        ),
      ],
    );
  }
}
