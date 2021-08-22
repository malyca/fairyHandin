import 'package:fairytales/Quiz_4/yeah.dart';
import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class QuestionScroll10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      SizedBox(height: 40),
      Quizzen(),
      SizedBox(height: 40),
    ]);
  }
}

class Question10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text(
            "Spørgsmål 10",
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
            child: QuestionScroll10()));
  }
}

TextEditingController _textFieldController = TextEditingController();
DateTime now = DateTime.now();
Random random = new Random();

class Quizzen extends StatelessWidget {
  CollectionReference quiz2 = FirebaseFirestore.instance.collection('Quiz4');
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
              int firstvariable = hard[random.nextInt(12)];
              int secondvariable = hard[random.nextInt(12)];
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
                                            prefs.setInt("quiz4Question10", 5);
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(now);
                                            String month =
                                                DateFormat('MM').format(now);
                                            int privateuser =
                                                prefs.getInt("privatbruger");
                                            String email =
                                                prefs.getString("email");
                                            int quiz4_1 =
                                                prefs.getInt("quiz4Question1");
                                            int quiz4_2 =
                                                prefs.getInt("quiz4Question2");
                                            int quiz4_3 =
                                                prefs.getInt("quiz4Question3");
                                            int quiz4_4 =
                                                prefs.getInt("quiz4Question4");
                                            int quiz4_5 =
                                                prefs.getInt("quiz4Question5");
                                            int quiz4_6 =
                                                prefs.getInt("quiz4Question6");
                                            int quiz4_7 =
                                                prefs.getInt("quiz4Question7");
                                            int quiz4_8 =
                                                prefs.getInt("quiz4Question8");
                                            int quiz4_9 =
                                                prefs.getInt("quiz4Question9");
                                            int quiz4_10 =
                                                prefs.getInt("quiz4Question10");
                                            int sumscore = quiz4_1 +
                                                quiz4_2 +
                                                quiz4_3 +
                                                quiz4_4 +
                                                quiz4_5 +
                                                quiz4_6 +
                                                quiz4_7 +
                                                quiz4_8 +
                                                quiz4_9 +
                                                quiz4_10;
                                            quiz2
                                                .add({
                                                  "month": month,
                                                  "date": formattedDate,
                                                  "usertype": privateuser,
                                                  "email": email,
                                                  "class": "none",
                                                  "school": "none",
                                                  "q2_1": quiz4_1,
                                                  "q2_2": quiz4_2,
                                                  "q2_3": quiz4_3,
                                                  "q2_4": quiz4_4,
                                                  "q2_5": quiz4_5,
                                                  "q2_6": quiz4_6,
                                                  "q2_7": quiz4_7,
                                                  "q2_8": quiz4_8,
                                                  "q2_9": quiz4_9,
                                                  "q2_10": quiz4_10,
                                                  "score": sumscore,
                                                })
                                                .then((value) =>
                                                    print("Answers added"))
                                                .catchError((error) => print(
                                                    "Failed to add answers: $error"));

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Confirmation()),
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
                                            prefs.setInt("quiz4Question10", 0);
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(now);
                                            String month =
                                                DateFormat('MM').format(now);
                                            int privateuser =
                                                prefs.getInt("privatbruger");
                                            String email =
                                                prefs.getString("email");
                                            int quiz4_1 =
                                                prefs.getInt("quiz4Question1");
                                            int quiz4_2 =
                                                prefs.getInt("quiz4Question2");
                                            int quiz4_3 =
                                                prefs.getInt("quiz4Question3");
                                            int quiz4_4 =
                                                prefs.getInt("quiz4Question4");
                                            int quiz4_5 =
                                                prefs.getInt("quiz4Question5");
                                            int quiz4_6 =
                                                prefs.getInt("quiz4Question6");
                                            int quiz4_7 =
                                                prefs.getInt("quiz4Question7");
                                            int quiz4_8 =
                                                prefs.getInt("quiz4Question8");
                                            int quiz4_9 =
                                                prefs.getInt("quiz4Question9");
                                            int quiz4_10 =
                                                prefs.getInt("quiz4Question10");
                                            int sumscore = quiz4_1 +
                                                quiz4_2 +
                                                quiz4_3 +
                                                quiz4_4 +
                                                quiz4_5 +
                                                quiz4_6 +
                                                quiz4_7 +
                                                quiz4_8 +
                                                quiz4_9 +
                                                quiz4_10;
                                            quiz2
                                                .add({
                                                  "month": month,
                                                  "date": formattedDate,
                                                  "usertype": privateuser,
                                                  "email": email,
                                                  "class": "none",
                                                  "school": "none",
                                                  "q2_1": quiz4_1,
                                                  "q2_2": quiz4_2,
                                                  "q2_3": quiz4_3,
                                                  "q2_4": quiz4_4,
                                                  "q2_5": quiz4_5,
                                                  "q2_6": quiz4_6,
                                                  "q2_7": quiz4_7,
                                                  "q2_8": quiz4_8,
                                                  "q2_9": quiz4_9,
                                                  "q2_10": quiz4_10,
                                                  "score": sumscore,
                                                })
                                                .then((value) =>
                                                    print("Answers added"))
                                                .catchError((error) => print(
                                                    "Failed to add answers: $error"));
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Confirmation()),
                                            );
                                          },
                                        )
                                      ],
                                    );
                                  });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Confirmation()),
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
              'Spørgsmål 10',
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
