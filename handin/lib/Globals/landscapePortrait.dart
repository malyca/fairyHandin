import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

void deviceOrientationPortrait() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

void deviceOrientationLandscape() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
}
