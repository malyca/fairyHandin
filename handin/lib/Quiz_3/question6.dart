import 'package:fairytales/Quiz_3/question7.dart';
import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class QuestionScroll6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      SizedBox(height: 20),
      Question(),
      SizedBox(height: 20),
      Button12(),
      Button34(),
      SizedBox(height: 20),
    ]);
  }
}

class Question6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text(
            "Spørgsmål 6",
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
                image: AssetImage("asset/submenu3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: QuestionScroll6()));
  }
}

Random random = new Random();
int numberOfQuestion = random.nextInt(3);

class Button12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Button1(), Button2()]);
  }
}

class Button34 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Button3(), Button4()]);
  }
}

class Question extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Klik på den runde figur",
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

class Button1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    int numberofFigure = random.nextInt(20);
    if (numberOfQuestion == 0) {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, 0),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(triangles[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else if (numberOfQuestion == 1) {
      return Row(
        children: [
          Container(
            alignment: Alignment(-0.5, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(squares[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else if (numberOfQuestion == 2) {
      return Row(
        children: [
          Container(
            alignment: Alignment(-0.5, 0),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
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
                                    prefs.setInt("quiz3Question6", 5);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(circles[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(pentagon[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    }
  }
}

class Button2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    int numberofFigure = random.nextInt(20);
    if (numberOfQuestion == 0) {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(squares[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else if (numberOfQuestion == 1) {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
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
                                    prefs.setInt("quiz3Question6", 5);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(circles[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else if (numberOfQuestion == 2) {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(pentagon[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(triangles[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    }
  }
}

class Button3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    int numberofFigure = random.nextInt(20);
    if (numberOfQuestion == 0) {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
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
                                    prefs.setInt("quiz3Question6", 5);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(circles[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else if (numberOfQuestion == 1) {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(pentagon[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else if (numberOfQuestion == 2) {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(triangles[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(squares[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    }
  }
}

class Button4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    int numberofFigure = random.nextInt(20);
    if (numberOfQuestion == 0) {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(pentagon[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else if (numberOfQuestion == 1) {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(triangles[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else if (numberOfQuestion == 2) {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Det var ikke rigtigt",
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
                                    'Øv',
                                    style: TextStyle(
                                      fontSize: buttonText,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  onPressed: () async {
                                    prefs.setInt("quiz3Question6", 0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(squares[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Container(
            alignment: Alignment(0, -0.5),
            child: ButtonTheme(
                minWidth: 130.0,
                height: 130.0,
                child: FlatButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
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
                                    prefs.setInt("quiz3Question6", 5);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question7()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset(circles[numberofFigure]))
                // ignore: deprecated_member_use
                ),
          ),
        ],
      );
    }
  }
}
