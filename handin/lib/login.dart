import 'package:fairytales/Globals/landscapePortrait.dart';
import 'package:fairytales/forgotPassword.dart';
import 'package:fairytales/levelmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

List p;
List money;
List quiz1;
List quiz2;
List quiz3;
List quiz4;
List shopitem;
List shopSpent;

class _LoginViewState extends State<Login> {
  bool _showPassword = false;
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    future:
    Firebase.initializeApp();

    final imageLogo =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        'asset/pirateslogo.png',
        fit: BoxFit.contain,
      ),
    ]);

    final userNameField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.person,
          color: Colors.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: greenColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        labelText: 'brugernavn',
        labelStyle: TextStyle(fontFamily: "Montserrat", color: Colors.grey),
        hintText: 'bruger',
        hintStyle: TextStyle(fontFamily: "Montserrat", color: Colors.black),
      ),
    );

    final passwordField = Column(
      children: <Widget>[
        TextFormField(
          obscureText: true,
          controller: _passwordController,
          style: TextStyle(
            color: Colors.black,
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.lock),
              color: Colors.grey,
              onPressed: () {
                setState(() => this._showPassword = !this._showPassword);
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: greenColor, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            labelText: 'kode',
            labelStyle: TextStyle(fontFamily: "Montserrat", color: Colors.grey),
            hintText: 'kode',
            hintStyle: TextStyle(fontFamily: "Montserrat", color: Colors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
      ],
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          imageLogo,
          SizedBox(height: 50),
          userNameField,
          SizedBox(height: 20),
          passwordField,
        ],
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: greenColor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Start",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: buttonText,
              color: Colors.white,
              fontFamily: "Montserrat",
            ),
          ),
          onPressed: () async {
            try {
              final User user =
                  (await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
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
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setInt("privatbruger", 1);
                prefs.setString("email", _emailController.text);
                prefs.setString("password", _passwordController.text);

                FirebaseFirestore.instance
                    .collection("Quiz1")
                    .where('email', isEqualTo: _emailController.text)
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
                    .where('email', isEqualTo: _emailController.text)
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
                    .where('email', isEqualTo: _emailController.text)
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
                    .where('email', isEqualTo: _emailController.text)
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

                  if (prefs.getInt("index1") == null) {
                    prefs.setInt("index1", 0);
                  }
                  if (prefs.getInt("index2") == null) {
                    prefs.setInt("index2", 0);
                  }
                  if (prefs.getInt("index3") == null) {
                    prefs.setInt("index3", 0);
                  }
                  if (prefs.getInt("index4") == null) {
                    prefs.setInt("index4", 0);
                  }
                  int sumMoney = prefs.getInt("index1") +
                      prefs.getInt("index2") +
                      prefs.getInt("index3") +
                      prefs.getInt("index4");
                  prefs.setString("money", sumMoney.toString());

                  FirebaseFirestore.instance
                      .collection("Shop")
                      .where('email', isEqualTo: _emailController.text)
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

                      prefs.setString("moneyforshop", moneys.toString());
                    } else {
                      prefs.setString("moneyforshop", sumMoney.toString());
                    }
                  });
                });

                FirebaseFirestore.instance
                    .collection("Shop")
                    .where('email', isEqualTo: _emailController.text)
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
              _emailController.text = "";
              _passwordController.text = "";
            }
          }),
    );

    final forgotPassword = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: greenColor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Glemt kode",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: buttonText,
              color: Colors.white,
              fontFamily: "Montserrat",
            ),
          ),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotPassword()),
            );
          }),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        SizedBox(height: 20),
        forgotPassword,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                fields,
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
