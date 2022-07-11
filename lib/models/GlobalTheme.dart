import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTheme with ChangeNotifier {
  final globalTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    backgroundColor: Color.fromRGBO(199, 231, 255,1),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontWeight: FontWeight.bold,

        color: Color.fromRGBO(4, 88, 125,1),
        fontSize: 17

      ),
      bodyText2: TextStyle(
        color: Color.fromRGBO(70, 155, 196,1),
        //Color.fromRGBO(64, 191, 197, 1),
        fontSize: 15,
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