import 'package:flutter/material.dart';

import 'pages.dart';

class PageShow extends StatelessWidget {
  final figx;
  final figy;
  final pageID;

  PageShow({this.figx, this.figy, this.pageID});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Image.asset(book[pageID]),
      ),
    );
  }
}
