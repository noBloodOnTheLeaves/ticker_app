import 'package:flutter/material.dart';

Color primary = const Color(0xFF89CFF0);

class AppStyles {
  static Color primaryColor = primary;

  static TextStyle headlineText =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.w500);

  static TextStyle titleText =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  static TextStyle viewText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    foreground: Paint()
      ..shader = LinearGradient(
        colors: <Color>[Colors.white, Colors.blue],
      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
  );

  static TextStyle aboveHeadlineText = const TextStyle(
      color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500);
}
