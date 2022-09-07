import 'package:flutter/material.dart';

// https://stackoverflow.com/questions/71858234/how-to-change-the-app-global-primary-color-in-flutter-on-button-press
class AppTheme {
  static final ThemeData purple = ThemeData(
    scaffoldBackgroundColor: const Color(0xffB39DDB),
    hintColor: const Color(0xff9575CD),
    cardColor: const Color(0xffD1C4E9).withOpacity(0.3),
    iconTheme: const IconThemeData(color: Colors.white70),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Color(0xff37474F)),
      labelMedium: TextStyle(color: Color(0xff37474F)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff9575CD),
      focusColor: Color(0xffB39DDB),
      splashColor: Color(0xffD1C4E9),
    ),
  );

    static final ThemeData pink = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF8BBD0),
    hintColor: const Color(0xffF48FB1),
    cardColor: const Color(0xffFCE4EC).withOpacity(0.3),
    iconTheme: const IconThemeData(color: Colors.white70),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Color(0xff37474F)),
      labelMedium: TextStyle(color: Color(0xff37474F)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xffF48FB1),
      focusColor: Color(0xffF8BBD0),
      splashColor: Color(0xffFCE4EC),
    ),
  );
}
