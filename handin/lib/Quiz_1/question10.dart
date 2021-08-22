import 'package:fairytales/Quiz_1/yeah.dart';
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
                image: AssetImage("asset/submenu1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: QuestionScroll10()));
  }
}

Random random = new Random();
TextEditingController _textFieldController = TextEditingController();

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
                "Spørgsmål 10",
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
        body: QuestionScroll10());
  }
}

DateTime now = DateTime.now();

class Quizzen extends StatelessWidget {
  CollectionReference quiz1 = FirebaseFirestore.instance.collection('Quiz1');
  @override
  Widget build(BuildContext context) {
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
              int firstvariable = easy[random.nextInt(4)];
              int secondvariable = easy[random.nextInt(4)];
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
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(now);
                                            String month =
                                                DateFormat('MM').format(now);

                                            prefs.setInt("quiz1Question10", 5);
                                            int privateuser =
                                                prefs.getInt("privatbruger");
                                            String email =
                                                prefs.getString("email");
                                            int quiz1_1 =
                                                prefs.getInt("quiz1Question1");
                                            int quiz1_2 =
                                                prefs.getInt("quiz1Question2");
                                            int quiz1_3 =
                                                prefs.getInt("quiz1Question3");
                                            int quiz1_4 =
                                                prefs.getInt("quiz1Question4");
                                            int quiz1_5 =
                                                prefs.getInt("quiz1Question5");
                                            int quiz1_6 =
                                                prefs.getInt("quiz1Question6");
                                            int quiz1_7 =
                                                prefs.getInt("quiz1Question7");
                                            int quiz1_8 =
                                                prefs.getInt("quiz1Question8");
                                            int quiz1_9 =
                                                prefs.getInt("quiz1Question9");
                                            int quiz1_10 =
                                                prefs.getInt("quiz1Question10");
                                            int sumscore = quiz1_1 +
                                                quiz1_2 +
                                                quiz1_3 +
                                                quiz1_4 +
                                                quiz1_5 +
                                                quiz1_6 +
                                                quiz1_7 +
                                                quiz1_8 +
                                                quiz1_9 +
                                                quiz1_10;
                                            quiz1
                                                .add({
                                                  "month": month,
                                                  "date": formattedDate,
                                                  "usertype": privateuser,
                                                  "email": email,
                                                  "q1_1": quiz1_1,
                                                  "q1_2": quiz1_2,
                                                  "q1_3": quiz1_3,
                                                  "q1_4": quiz1_4,
                                                  "q1_5": quiz1_5,
                                                  "q1_6": quiz1_6,
                                                  "q1_7": quiz1_7,
                                                  "q1_8": quiz1_8,
                                                  "q1_9": quiz1_9,
                                                  "q1_10": quiz1_10,
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
                                            prefs.setInt("quiz1Question10", 0);
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(now);
                                            String month =
                                                DateFormat('MM').format(now);
                                            prefs.setInt("quiz1Question10", 5);
                                            int privateuser =
                                                prefs.getInt("privatbruger");
                                            String email =
                                                prefs.getString("email");
                                            int quiz1_1 =
                                                prefs.getInt("quiz1Question1");
                                            int quiz1_2 =
                                                prefs.getInt("quiz1Question2");
                                            int quiz1_3 =
                                                prefs.getInt("quiz1Question3");
                                            int quiz1_4 =
                                                prefs.getInt("quiz1Question4");
                                            int quiz1_5 =
                                                prefs.getInt("quiz1Question5");
                                            int quiz1_6 =
                                                prefs.getInt("quiz1Question6");
                                            int quiz1_7 =
                                                prefs.getInt("quiz1Question7");
                                            int quiz1_8 =
                                                prefs.getInt("quiz1Question8");
                                            int quiz1_9 =
                                                prefs.getInt("quiz1Question9");
                                            int quiz1_10 =
                                                prefs.getInt("quiz1Question10");
                                            int sumscore = quiz1_1 +
                                                quiz1_2 +
                                                quiz1_3 +
                                                quiz1_4 +
                                                quiz1_5 +
                                                quiz1_6 +
                                                quiz1_7 +
                                                quiz1_8 +
                                                quiz1_9 +
                                                quiz1_10;
                                            quiz1
                                                .add({
                                                  "month": month,
                                                  "date": formattedDate,
                                                  "usertype": privateuser,
                                                  "email": email,
                                                  "class": "none",
                                                  "school": "none",
                                                  "q1_1": quiz1_1,
                                                  "q1_2": quiz1_2,
                                                  "q1_3": quiz1_3,
                                                  "q1_4": quiz1_4,
                                                  "q1_5": quiz1_5,
                                                  "q1_6": quiz1_6,
                                                  "q1_7": quiz1_7,
                                                  "q1_8": quiz1_8,
                                                  "q1_9": quiz1_9,
                                                  "q1_10": quiz1_10,
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
                                    builder: (context) => Question1()),
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
            color: purpleColor,
          ),
        ),
      ],
    );
  }
}
