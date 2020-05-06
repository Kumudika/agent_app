import 'package:flutter/material.dart';

ThemeData defaultTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff38A9D9),
    accentColor: Colors.cyan[600],

    // Define the default font family.
    fontFamily: 'Avenir LT Std',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}
