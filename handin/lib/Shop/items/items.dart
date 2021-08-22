
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:shared_preferences/shared_preferences.dart';

CollectionReference shop = FirebaseFirestore.instance.collection('Shop');

class BlueShooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Row(
      children: [
        Container(
          alignment: Alignment(0, -0.5),
          child: ButtonTheme(
              minWidth: 100.0,
              height: 100.0,
              // ignore: deprecated_member_use
              child: FlatButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Vil du købe den blå?",
                              style: TextStyle(
                                fontSize: buttonText,
                                color: Colors.blue,
                                fontFamily: "Montserrat",
                              ),
                            ),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              new FlatButton(
                                child: new Text(
                                  'Ja ',
                                  style: TextStyle(
                                    fontSize: buttonText,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  String email = prefs.getString("email");

                                  prefs.setInt("Blue", 1);

                                  shop
                                    ..add({
                                      "Item": "blue",
                                      "email": email,
                                    })
                                        .then(
                                            (value) => print("Shopitem Added"))
                                        .catchError((error) => print(
                                            "Failed to add shopitem: $error"));
                                },
                              ),
                              new FlatButton(
                                child: new Text(
                                  'Nej ',
                                  style: TextStyle(
                                    fontSize: buttonText,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });

                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset('asset/shopitems/Bread.png'))
              // ignore: deprecated_member_use
              ),
        ),
      ],
    );
  }
}

class PinkShooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Row(
      children: [
        Container(
          alignment: Alignment(0, 0.5),
          child: ButtonTheme(
              minWidth: 130.0,
              height: 130.0,
              child: FlatButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Vil du købe den lyserøde?",
                              style: TextStyle(
                                fontSize: buttonText,
                                color: Colors.pink,
                                fontFamily: "Montserrat",
                              ),
                            ),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              new FlatButton(
                                child: new Text(
                                  'Ja ',
                                  style: TextStyle(
                                    fontSize: buttonText,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  String email = prefs.getString("email");

                                  prefs.setInt("Pink", 1);

                                  shop
                                    ..add({
                                      "Item": "pink",
                                      "email": email,
                                    })
                                        .then(
                                            (value) => print("Shopitem Added"))
                                        .catchError((error) => print(
                                            "Failed to add shopitem: $error"));
                                },
                              ),
                              new FlatButton(
                                child: new Text(
                                  'Nej ',
                                  style: TextStyle(
                                    fontSize: buttonText,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });

                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset('asset/shopitems/pinkShooter.png'))
              // ignore: deprecated_member_use
              ),
        ),
      ],
    );
  }
}

class RedShooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Row(
      children: [
        Container(
          alignment: Alignment(0, -0.5),
          child: ButtonTheme(
              minWidth: 100.0,
              height: 100.0,
              child: FlatButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Vil du købe den røde?",
                              style: TextStyle(
                                fontSize: buttonText,
                                color: Colors.red,
                                fontFamily: "Montserrat",
                              ),
                            ),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              new FlatButton(
                                child: new Text(
                                  'Ja ',
                                  style: TextStyle(
                                    fontSize: buttonText,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  String email = prefs.getString("email");

                                  prefs.setInt("Red", 1);

                                  shop
                                    ..add({
                                      "Item": "red",
                                      "email": email,
                                    })
                                        .then(
                                            (value) => print("Shopitem Added"))
                                        .catchError((error) => print(
                                            "Failed to add shopitem: $error"));
                                },
                              ),
                              new FlatButton(
                                child: new Text(
                                  'Nej ',
                                  style: TextStyle(
                                    fontSize: buttonText,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });

                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset('asset/shopitems/redShooter.png'))
              // ignore: deprecated_member_use
              ),
        ),
      ],
    );
  }
}

class PurpleShooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Row(
      children: [
        Container(
          alignment: Alignment(0, -0.5),
          child: ButtonTheme(
              minWidth: 100.0,
              height: 100.0,
              child: FlatButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Vil du købe den lilla?",
                              style: TextStyle(
                                fontSize: buttonText,
                                color: Colors.purple,
                                fontFamily: "Montserrat",
                              ),
                            ),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              new FlatButton(
                                child: new Text(
                                  'Ja ',
                                  style: TextStyle(
                                    fontSize: buttonText,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  String email = prefs.getString("email");

                                  prefs.setInt("Purple", 1);

                                  shop
                                    ..add({
                                      "Item": "purple",
                                      "email": email,
                                    })
                                        .then(
                                            (value) => print("Shopitem Added"))
                                        .catchError((error) => print(
                                            "Failed to add shopitem: $error"));
                                },
                              ),
                              new FlatButton(
                                child: new Text(
                                  'Nej ',
                                  style: TextStyle(
                                    fontSize: buttonText,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });

                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset('asset/shopitems/purpleShooter.png'))
              // ignore: deprecated_member_use
              ),
        ),
      ],
    );
  }
}

class GreenShooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Row(
      children: [
        Container(
          alignment: Alignment(0, -0.5),
          child: ButtonTheme(
              minWidth: 100.0,
              height: 100.0,
              child: FlatButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Vil du købe den grønne?",
                              style: TextStyle(
                                fontSize: buttonText,
                                color: Colors.green,
                                fontFamily: "Montserrat",
                              ),
                            ),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              new FlatButton(
                                child: new Text(
                                  'Ja ',
                                  style: TextStyle(
                                    fontSize: buttonText,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  String email = prefs.getString("email");

                                  prefs.setInt("Green", 1);

                                  shop
                                    ..add({
                                      "Item": "green",
                                      "email": email,
                                    })
                                        .then(
                                            (value) => print("Shopitem Added"))
                                        .catchError((error) => print(
                                            "Failed to add shopitem: $error"));
                                },
                              ),
                              new FlatButton(
                                child: new Text(
                                  'Nej ',
                                  style: TextStyle(
                                    fontSize: buttonText,
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });

                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset('asset/shopitems/greenShooter.png'))
              // ignore: deprecated_member_use
              ),
        ),
      ],
    );
  }
}
