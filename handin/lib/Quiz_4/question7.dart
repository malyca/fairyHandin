import 'package:fairytales/Quiz_4/question8.dart';
import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class QuestionScroll7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      SizedBox(height: 40),
      Quizzen(),
      SizedBox(height: 40),
    ]);
  }
}

class Question7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text(
            "Spørgsmål 7",
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
                image: AssetImage("asset/submenu4.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: QuestionScroll7()));
  }
}

TextEditingController _textFieldController = TextEditingController();

Random random = new Random();

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
              double firstvariable = scale3[random.nextInt(9)].toDouble();
              double secondvariable = 3;
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        firstvariable.toStringAsFixed(0) +
                            " / " +
                            secondvariable.toStringAsFixed(0) +
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
                            double result = firstvariable / secondvariable;
                            String resultString = result.toStringAsFixed(0);
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
                                            prefs.setInt("quiz4Question7", 5);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Question8()),
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
                                        'Neeeeej, svaret var: \n \n' +
                                            resultString,
                                        style: TextStyle(
                                          fontSize: buttonText,
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                        ),
                                        textAlign: TextAlign.center,
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
                                            prefs.setInt("quiz4Question7", 0);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Question8()),
                                            );
                                          },
                                        )
                                      ],
                                    );
                                  });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Question8()),
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
              'Spørgsmål 7',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.help,
              size: 40,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: pinkColor,
            color: orangeColor,
          ),
        ),
      ],
    );
  }
}
