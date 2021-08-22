import 'package:fairytales/Shop/shots.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fairytales/Globals/globalvariables.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharkShop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Shop();
}

CollectionReference shop = FirebaseFirestore.instance.collection('Shop');

class _Shop extends State<SharkShop> {
  static String money = "0";

  void getMoney() async {
    SharedPreferences.getInstance().then((prefValue) => {
          setState(() {
            money = prefValue.getString('moneyforshop') ?? "";
          })
        });
  }

  void spentMoney() {
    int newMoney = int.parse(money);
    if (newMoney > 50) {
      setState(() {
        newMoney -= 50;
        money = newMoney.toString();
      });
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Du har ikke penge nok",
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
                    'ØV!',
                    style: TextStyle(
                      fontSize: buttonText,
                      color: Colors.black,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  void _buyBlueItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getStringList("ShopItems").contains("blue") ||
        prefs.getInt('Blue') == 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du have blå skud",
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
                    prefs.setString("Shooting", "BlueShot");
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du købe den blå for 50 kroner?",
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
                    spentMoney();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("Shooting", "BlueShot");
                    String email = prefs.getString("email");

                    prefs.setInt("Blue", 1);

                    shop
                        .add({
                          "Item": "blue",
                          "Spent": -50,
                          "email": email,
                        })
                        .then((value) => print("Shopitem Added"))
                        .catchError(
                            (error) => print("Failed to add shopitem: $error"));
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
      setState(() {
        BlueShooter();
      });
    }
  }

  void _buyRedItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("ShopItems").contains("red") ||
        prefs.getInt('Red') == 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du have røde skud",
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
                    prefs.setString("Shooting", "RedShot");
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du købe den røde for 50 kroner?",
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
                    spentMoney();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("Shooting", "RedShot");
                    String email = prefs.getString("email");

                    prefs.setInt("Red", 1);

                    shop
                        .add({
                          "Item": "red",
                          "Spent": -50,
                          "email": email,
                        })
                        .then((value) => print("Shopitem Added"))
                        .catchError(
                            (error) => print("Failed to add shopitem: $error"));
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  void _buyPurpleItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("ShopItems").contains("purple") ||
        prefs.getInt('Purple') == 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du have lilla skud",
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
                    prefs.setString("Shooting", "PurpleShot");
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du købe den lilla for 50 kroner?",
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
                    spentMoney();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String email = prefs.getString("email");
                    prefs.setString("Shooting", "PurpleShot");
                    prefs.setInt("Purple", 1);
                    setState(() {
                      PurpleShooter();
                    });

                    shop
                        .add({
                          "Item": "purple",
                          "Spent": -50,
                          "email": email,
                        })
                        .then((value) => print("Shopitem Added"))
                        .catchError(
                            (error) => print("Failed to add shopitem: $error"));
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  void _buyPinkItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("ShopItems").contains("pink") ||
        prefs.getInt('Pink') == 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du have lyserøde skud",
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
                    prefs.setString("Shooting", "PinkShot");
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du købe den lyserøde for 50 kroner?",
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
                    spentMoney();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("Shooting", "PinkShot");
                    String email = prefs.getString("email");

                    prefs.setInt("Pink", 1);

                    shop
                        .add({
                          "Item": "pink",
                          "Spent": -50,
                          "email": email,
                        })
                        .then((value) => print("Shopitem Added"))
                        .catchError(
                            (error) => print("Failed to add shopitem: $error"));
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  void _buyOrangeItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("ShopItems").contains("orange") ||
        prefs.getInt('Orange') == 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du have orange skud",
                style: TextStyle(
                  fontSize: buttonText,
                  color: Colors.orange,
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
                    prefs.setString("Shooting", "OrangeShot");
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du købe den orange for 50 kroner?",
                style: TextStyle(
                  fontSize: buttonText,
                  color: Colors.orange,
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
                    spentMoney();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("Shooting", "OrangeShot");
                    String email = prefs.getString("email");

                    prefs.setInt("Orange", 1);

                    shop
                        .add({
                          "Item": "orange",
                          "Spent": -50,
                          "email": email,
                        })
                        .then((value) => print("Shopitem Added"))
                        .catchError(
                            (error) => print("Failed to add shopitem: $error"));
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  void _buyGreenItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("ShopItems").contains("green") ||
        prefs.getInt('Green') == 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du have grønne skud",
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
                    prefs.setString("Shooting", "GreenShot");
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Vil du købe den grønne for 50 kroner?",
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
                    spentMoney();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("Shooting", "GreenShot");
                    String email = prefs.getString("email");

                    prefs.setInt("Green", 1);

                    shop
                        .add({
                          "Item": "green",
                          "Spent": -50,
                          "email": email,
                        })
                        .then((value) => print("Shopitem Added"))
                        .catchError(
                            (error) => print("Failed to add shopitem: $error"));
                    Navigator.of(context).pop();
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    double firstshelfPlacementy = -0.8;
    double secondshelfPlacementy = -0.2;
    if (money == "0") {
      getMoney();
    } else {
      spentMoney();
    }
    return Scaffold(
        appBar: AppBar(
          shadowColor: yellowColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Hajens butik",
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
          backgroundColor: purpleColor,
        ),
        body: Column(children: [
          Expanded(
              child: Stack(children: [
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/Shop.png"), fit: BoxFit.fill),
            )),
            Container(
              alignment: Alignment(-0.95, -0.95),
              child: Text(
                "P E N G E : " + money,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    color: Colors.white),
              ),
            ),
            Container(
              child: Container(
                alignment: Alignment(-0.9, firstshelfPlacementy),
                child: BlueShooter(
                  function: _buyBlueItem,
                ),
              ),
            ),
            Container(
              child: Container(
                alignment: Alignment(-0.7, firstshelfPlacementy),
                child: RedShooter(
                  function: _buyRedItem,
                ),
              ),
            ),
            Container(
              child: Container(
                alignment: Alignment(-0.5, firstshelfPlacementy),
                child: GreenShooter(
                  function: _buyGreenItem,
                ),
              ),
            ),
            Container(
              child: Container(
                alignment: Alignment(-0.9, secondshelfPlacementy),
                child: OrangeShooter(
                  function: _buyOrangeItem,
                ),
              ),
            ),
            Container(
              child: Container(
                alignment: Alignment(-0.7, secondshelfPlacementy),
                child: PinkShooter(
                  function: _buyPinkItem,
                ),
              ),
            ),
            Container(
              child: Container(
                alignment: Alignment(-0.5, secondshelfPlacementy),
                child: PurpleShooter(
                  function: _buyPurpleItem,
                ),
              ),
            ),
          ]))
        ]));
  }
}
