import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fairytales/Book/pageController.dart';

import 'package:fairytales/levelmenu.dart';
import 'package:flutter/material.dart';
import 'package:fairytales/Globals/globalvariables.dart';
import 'buttons.dart';

class LevelBooks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Books();
}

class Books extends State<LevelBooks> {
  static int pageVariable = 0;

  int placex = 0;
  int placey = 0;
  bool next = false;

  void nextPage() {
    setState(() {
      if (pageVariable < 55) {
        stopMusic();
        pageVariable += 1;
        playMusic();
      } else {
        _showDialogEnd();
      }
    });
  }

  void previousPage() {
    setState(() {
      if (pageVariable > 0) {
        stopMusic();
        pageVariable -= 1;
        playMusic();
      } else {
        _showDialog();
      }
    });
  }

  final assetsAudioPlayer = AssetsAudioPlayer();
  void playMusic() {
    setState(() {
      assetsAudioPlayer.open(Audio(audio[pageVariable]));

      print(audio[pageVariable]);
      print(pageVariable);
    });
  }

  void stopMusic() {
    setState(() {
      assetsAudioPlayer.stop();
    });
  }

  void _showDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.grey[700],
              title: Center(
                  child: Text(
                "Gå ud af bogen?",
                style: TextStyle(
                  fontSize: buttonText,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              )),
              actions: <Widget>[
                // ignore: deprecated_member_use
                new FlatButton(
                    child: new Text(
                      'Ja',
                      style: TextStyle(
                        fontSize: buttonText,
                        color: Colors.white,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    onPressed: () {
                      pageVariable = 0;
                      stopMusic();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LevelMenu()),
                      );
                    }),
                new FlatButton(
                    child: new Text(
                      'Nej',
                      style: TextStyle(
                        fontSize: buttonText,
                        color: Colors.white,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  void _showDialogEnd() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.grey[700],
              title: Center(
                  child: Text(
                "Slut",
                style: TextStyle(
                  fontSize: buttonText,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              )),
              actions: <Widget>[
                // ignore: deprecated_member_use
                new FlatButton(
                    child: new Text(
                      'Øv!',
                      style: TextStyle(
                        fontSize: buttonText,
                        color: Colors.white,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    onPressed: () {
                      pageVariable = 0;
                      stopMusic();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LevelMenu()),
                      );
                    }),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: purpleColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.menu_book,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              Text(
                "Pause",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: buttonText,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              ),
            ],
          ),
          leading: new Container(
            child: new FlatButton(
              child: new Icon(
                Icons.close,
                size: 20,
                color: Colors.white,
              ),
              onPressed: () {
                pageVariable = 0;
                stopMusic();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelMenu()),
                );
              },
            ),
          ),
          backgroundColor: purpleColor,
        ),
        body: Column(children: [
          Expanded(
            flex: 4,
            child: Stack(children: [
              Container(
                color: Colors.blueGrey,
              ),
              Container(
                alignment: Alignment(0, 0),
                child: PageShow(
                  figx: placex,
                  figy: placey,
                  pageID: pageVariable,
                ),
              ),
            ]),
          ),
          Expanded(
            child: Container(
              color: Colors.blueGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonsForBook(
                    icon: Icons.keyboard_arrow_left,
                    function: previousPage,
                  ),
                  ButtonsForBook(
                    icon: Icons.keyboard_arrow_right,
                    function: nextPage,
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}

List<String> book = [
  "asset/book/Forside.PNG",
  "asset/book/1.png",
  "asset/book/2.png",
  "asset/book/3.png",
  "asset/book/4.png",
  "asset/book/5.png",
  "asset/book/6.png",
  "asset/book/7.png",
  "asset/book/8.png",
  "asset/book/9.png",
  "asset/book/10.png",
  "asset/book/11.png",
  "asset/book/12.png",
  "asset/book/13.png",
  "asset/book/14.png",
  "asset/book/15.png",
  "asset/book/16.png",
  "asset/book/17.png",
  "asset/book/18.png",
  "asset/book/19.png",
  "asset/book/20.png",
  "asset/book/21.png",
  "asset/book/22.png",
  "asset/book/23.png",
  "asset/book/24.png",
  "asset/book/25.png",
  "asset/book/26.png",
  "asset/book/27.png",
  "asset/book/28.png",
  "asset/book/29.png",
  "asset/book/30.png",
  "asset/book/31.png",
  "asset/book/32.png",
  "asset/book/33.png",
  "asset/book/34.png",
  "asset/book/35.png",
  "asset/book/36.png",
  "asset/book/37.png",
  "asset/book/38.png",
  "asset/book/39.png",
  "asset/book/40.png",
  "asset/book/41.png",
  "asset/book/42.png",
  "asset/book/43.png",
  "asset/book/44.png",
  "asset/book/45.png",
  "asset/book/46.png",
  "asset/book/47.png",
  "asset/book/48.PNG",
  "asset/book/49.png",
  "asset/book/50.png",
  "asset/book/51.png",
  "asset/book/52.png",
  "asset/book/53.png",
  "asset/book/54.png",
  "asset/book/55.png",
];
List<String> audio = [
  'asset/book/audio/StartSound.mp3',
  'asset/book/audio/1.mp3',
  'asset/book/audio/2.mp3',
  'asset/book/audio/3.mp3',
  'asset/book/audio/4.mp3',
  'asset/book/audio/5.mp3',
  'asset/book/audio/6.mp3',
  'asset/book/audio/7.mp3',
  'asset/book/audio/8.mp3',
  'asset/book/audio/9.mp3',
  'asset/book/audio/10.mp3',
  'asset/book/audio/11.mp3',
  'asset/book/audio/12.mp3',
  'asset/book/audio/13.mp3',
  'asset/book/audio/14.mp3',
  'asset/book/audio/15.mp3',
  'asset/book/audio/16.mp3',
  'asset/book/audio/17.mp3',
  'asset/book/audio/18.mp3',
  'asset/book/audio/19.mp3',
  'asset/book/audio/20.mp3',
  'asset/book/audio/21.mp3',
  'asset/book/audio/22.mp3',
  'asset/book/audio/23.mp3',
  'asset/book/audio/24.mp3',
  'asset/book/audio/25.mp3',
  'asset/book/audio/26.mp3',
  'asset/book/audio/27.mp3',
  'asset/book/audio/28.mp3',
  'asset/book/audio/29.mp3',
  'asset/book/audio/30.mp3',
  'asset/book/audio/31.mp3',
  'asset/book/audio/32.mp3',
  'asset/book/audio/33.mp3',
  'asset/book/audio/34.mp3',
  'asset/book/audio/35.mp3',
  'asset/book/audio/36.mp3',
  'asset/book/audio/37.mp3',
  'asset/book/audio/38.mp3',
  'asset/book/audio/39.mp3',
  'asset/book/audio/40.mp3',
  'asset/book/audio/41.mp3',
  'asset/book/audio/42.mp3',
  'asset/book/audio/43.mp3',
  'asset/book/audio/44.mp3',
  'asset/book/audio/45.mp3',
  'asset/book/audio/46.mp3',
  'asset/book/audio/47.mp3',
  'asset/book/audio/48.mp3',
  'asset/book/audio/49.mp3',
  'asset/book/audio/50.mp3',
  'asset/book/audio/51.mp3',
  'asset/book/audio/52.mp3',
  'asset/book/audio/53.mp3',
  'asset/book/audio/54.mp3',
  'asset/book/audio/55.mp3',
];
