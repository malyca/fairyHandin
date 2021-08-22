import 'package:fairytales/createUser.dart';
import 'package:fairytales/levelmenu.dart';
import 'package:fairytales/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fairytales/Globals/globalvariables.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Second()),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    future:
    Firebase.initializeApp();
    return ListView(children: <Widget>[
      SizedBox(height: 10),

      Logo(),
      UnderText(),
      SizedBox(height: 10),
      //UnderText(),

      NextButton(),
    ]);
  }
}

List p;
List money;
List quiz1;
List quiz2;
List quiz3;
List quiz4;
List shopitem;
List shopSpent;

class NextButton extends StatefulWidget {
  @override
  _NextButton createState() => _NextButton();
}

DateTime now = DateTime.now();

class _NextButton extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          child: RaisedButton.icon(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt("NoUser", 0);
              prefs.setBool("tetris", false);

              if (prefs.getString("email") == null ||
                  prefs.getString("password") == null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              } else {
                try {
                  final User user =
                      (await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: prefs.getString("email"),
                    password: prefs.getString("password"),
                  ))
                          .user;
                  if (user != null) {
                    FirebaseFirestore.instance
                        .collection("Students")
                        .get()
                        .then((querySnapshot) {
                      querySnapshot.docs.forEach((result) {
                        print(result.data()["UIDstudent"]);
                      });
                    });

                    FirebaseFirestore.instance
                        .collection("Quiz1")
                        .where('email', isEqualTo: prefs.getString('email'))
                        .get()
                        .then((querySnapshot) {
                      quiz1 = querySnapshot.docs
                          .map((e) => (e.data()["score"].toString()))
                          .toList();
                      print(quiz1);
                      if (quiz1 != null) {
                        final List<int> quiz1result =
                            quiz1.map((e) => int.parse(e)).toList();

                        int sumbefore = quiz1result.fold(0, (p, c) => p + c);

                        prefs.setInt("index1", sumbefore);
                      } else {
                        prefs.setInt("index1", 0);
                      }
                    });
                    FirebaseFirestore.instance
                        .collection("Quiz2")
                        .where('email', isEqualTo: prefs.getString('email'))
                        .get()
                        .then((querySnapshot) {
                      quiz2 = querySnapshot.docs
                          .map((e) => (e.data()["score"].toString()))
                          .toList();
                      if (quiz2 != null) {
                        final List<int> quiz2result =
                            quiz2.map((e) => int.parse(e)).toList();

                        int sumbefore = quiz2result.fold(0, (p, c) => p + c);

                        prefs.setInt("index2", sumbefore);
                        print(sumbefore);
                      } else {
                        prefs.setInt("index2", 0);
                      }
                    });
                    FirebaseFirestore.instance
                        .collection("Quiz3")
                        .where('email', isEqualTo: prefs.getString('email'))
                        .get()
                        .then((querySnapshot) {
                      quiz3 = querySnapshot.docs
                          .map((e) => (e.data()["score"].toString()))
                          .toList();
                      if (quiz3 != null) {
                        final List<int> quiz3result =
                            quiz3.map((e) => int.parse(e)).toList();

                        int sumbefore = quiz3result.fold(0, (p, c) => p + c);

                        prefs.setInt("index3", sumbefore);
                      } else {
                        prefs.setInt("index3", 0);
                      }
                    });
                    FirebaseFirestore.instance
                        .collection("Quiz4")
                        .where('email', isEqualTo: prefs.getString('email'))
                        .get()
                        .then((querySnapshot) {
                      quiz4 = querySnapshot.docs
                          .map((e) => (e.data()["score"].toString()))
                          .toList();
                      if (quiz4 != null) {
                        final List<int> quiz4result =
                            quiz4.map((e) => int.parse(e)).toList();

                        int sumbefore = quiz4result.fold(0, (p, c) => p + c);

                        prefs.setInt("index4", sumbefore);
                        print(sumbefore);
                      } else {
                        prefs.setInt("index4", 0);
                      }

                      int sumMoney = prefs.getInt("index1") +
                          prefs.getInt("index2") +
                          prefs.getInt("index3") +
                          prefs.getInt("index4");
                      prefs.setString("money", sumMoney.toString());

                      FirebaseFirestore.instance
                          .collection("Shop")
                          .where('email', isEqualTo: prefs.getString('email'))
                          .get()
                          .then((querySnapshot) {
                        shopSpent = querySnapshot.docs
                            .map((e) => (e.data()["Spent"].toString()))
                            .toList();
                        if (shopSpent != null) {
                          final List<int> spentCount =
                              shopSpent.map((e) => int.parse(e)).toList();
                          int sumbefore = spentCount.fold(0, (p, c) => p + c);

                          prefs.setString("spent", sumbefore.toString());
                          print(prefs.getString("spent"));
                        } else {
                          prefs.setString("spent", "0");
                        }
                        if (prefs.getString("spent") != null) {
                          int first = int.parse(prefs.getString("spent"));
                          int second = int.parse(prefs.getString("money"));
                          int moneys = first + second;
                          print("- " + first.toString());
                          print("+ " + second.toString());
                          print("Moneys " + moneys.toString());
                          prefs.setString("moneyforshop", moneys.toString());
                        } else {
                          prefs.setString("moneyforshop", sumMoney.toString());
                        }
                      });
                    });

                    FirebaseFirestore.instance
                        .collection("Shop")
                        .where('email', isEqualTo: prefs.getString('email'))
                        .get()
                        .then((querySnapshot) {
                      shopitem = querySnapshot.docs
                          .map((e) => (e.data()["Item"].toString()))
                          .toList();
                      prefs.setStringList("ShopItems", shopitem);
                      print(shopitem);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LevelMenu()),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Log ind',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.school,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: blueColor,
            color: greenColor,
          ),
        ),
        SizedBox(height: 10),
        ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          child: RaisedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Ny bruger',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: darkBlueColor,
            color: blueColor,
          ),
        ),
        SizedBox(height: 10),
        ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          child: RaisedButton.icon(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt("NoUser", 0);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Elev login',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.school,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: blueColor,
            color: purpleColor,
          ),
        ),
        SizedBox(height: 50),
        ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          child: RaisedButton.icon(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt("NoUser", 1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LevelMenu()),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Log ind uden en bruger',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: darkBlueColor,
            color: blueColor,
          ),
        ),
        Text(
          'Logger du ind uden en bruger, kan du ikke bruge butikken eller høre bogen.',
          style: TextStyle(fontSize: 20, fontFamily: "Montserrat"),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        'asset/pirateslogo.png',
        fit: BoxFit.contain,
        height: 200,
      ),
    ]);
  }
}

class UnderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Matematik med piraterne 2.0',
          style: TextStyle(fontSize: 35, fontFamily: "Montserrat"),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
