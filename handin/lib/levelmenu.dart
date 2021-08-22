import 'package:fairytales/Globals/globalvariables.dart';
import 'package:fairytales/Menus/submenu1.dart';
import 'package:fairytales/Menus/submenu2.dart';
import 'package:fairytales/Menus/submenu3.dart';
import 'package:fairytales/Menus/submenu4.dart';
import 'package:fairytales/Pause/tetris.dart';
import 'package:fairytales/Shop/aquarium.dart';
import 'package:fairytales/Shop/shop.dart';
import 'package:fairytales/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Book/pages.dart';

class LevelScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      SizedBox(height: mq.size.height / 6),
      LevelsButton1(),
      SizedBox(height: 20),
      LevelsButton2(),
      SizedBox(height: 20),
      Shop(),
      //SizedBox(height: 20),
      //Extra(),
    ]);
  }
}

class LevelMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Menu'),
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  value: 0,
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: redColor,
                    ),
                    title: Text('Log helt ud'),
                  ),
                ),
              ],
              onSelected: (result) async {
                if (result == 0) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove("password");
                  prefs.remove("email");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }
              },
            ),
          ],
          leading: new Container(),
          backgroundColor: purpleColor),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/backgroundMenu.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: LevelScroll(),
      ),
    );
  }
}

class LevelsButton1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTheme(
          minWidth: 130.0,
          height: 130.0,
          child: RaisedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubMenu1()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.extension,
              color: Colors.white,
              size: 40,
            ),
            textColor: Colors.white,
            splashColor: greenColor,
            color: redColor,
          ),
        ),
        SizedBox(width: 20),
        ButtonTheme(
          minWidth: 130.0,
          height: 130.0,
          child: RaisedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubMenu2()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.wb_sunny,
              color: Colors.white,
              size: 40,
            ),
            textColor: Colors.white,
            splashColor: redColor,
            color: yellowColor,
          ),
        ),
      ],
    );
  }
}

class LevelsButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTheme(
          minWidth: 130.0,
          height: 130.0,
          child: RaisedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubMenu3()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.star,
              color: Colors.white,
              size: 40,
            ),
            textColor: Colors.white,
            splashColor: yellowColor,
            color: blueColor,
          ),
        ),
        SizedBox(width: 20),
        ButtonTheme(
          minWidth: 130.0,
          height: 130.0,
          child: RaisedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubMenu4()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.school,
              color: Colors.white,
              size: 40,
            ),
            textColor: Colors.white,
            splashColor: blueColor,
            color: greenColor,
          ),
        ),
      ],
    );
  }
}

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTheme(
          minWidth: 130.0,
          height: 130.0,
          child: RaisedButton.icon(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if (prefs.getInt("NoUser") == 1) {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Du har ikke adgang, opret dig som bruger først og login",
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
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SharkShop()),
                );
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Butik',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.store,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: orangeColor,
            color: purpleColor,
          ),
        ),
        SizedBox(width: 20),
        ButtonTheme(
          minWidth: 130.0,
          height: 130.0,
          child: RaisedButton.icon(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if (prefs.getInt("NoUser") == 1) {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Du har ikke adgang, opret dig som bruger først og login",
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
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelBooks()),
                );
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Bog',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.menu_book,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: pinkColor,
            color: darkBlueColor,
          ),
        ),
      ],
    );
  }
}

class Logout {
  const Logout({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Logout> choices = const <Logout>[
  const Logout(title: 'Skift bruger', icon: Icons.logout),
];
