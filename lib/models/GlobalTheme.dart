import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTheme with ChangeNotifier {
  final globalTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(4, 88, 125,4),
        fontSize: 50
      ),
      bodyText2: TextStyle(
        color: Colors.blue,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      caption: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
      headline1: TextStyle(
        color: Colors.deepPurple,
        fontSize: 50,
        fontFamily: 'Allison',
      ),
      headline2: TextStyle(
        color: Colors.deepOrange,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.amber,
      // This will control the "back" icon
      iconTheme: IconThemeData(color: Colors.red),
      // This will control action icon buttons that locates on the right
      actionsIconTheme: IconThemeData(color: Colors.blue),
      centerTitle: false,
      elevation: 15,
      titleTextStyle: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontFamily: 'Allison',
        fontSize: 40,
      ),
    ),
  );
}