import 'package:flutter/material.dart';

ThemeData QListTheme() {
  return ThemeData(
    primaryColor: Colors.grey,
    splashColor: Colors.white,
    canvasColor: Colors.grey.shade900,
    textTheme: TextTheme(
      titleSmall: TextStyle(color: Colors.grey, fontSize: 16),
      titleMedium: TextStyle(color: Colors.white, fontSize: 20),
    ),
    buttonTheme: ButtonThemeData(splashColor: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(overlayColor: Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(overlayColor: Colors.white),
    ),
  );
}
