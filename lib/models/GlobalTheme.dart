import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTheme with ChangeNotifier {
  final globalTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    backgroundColor: /*Color.fromRGBO(199, 231, 255, 1)*/Color.fromRGBO(255,198,196,1),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        color: Colors.white,
        fontSize: 15

      ),
      bodyText2: TextStyle(
        //color: Colors.,
        color: Color.fromRGBO(4,88,125,1),
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      caption: TextStyle( ///items in settings_page
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
          color: Colors.black,
          fontSize: 20
      ),
      headline1: TextStyle( ///title in appBar
        color: Colors.white/*Color.fromRGBO(4,88,125,1)*/,
        fontSize: 35,
        //fontFamily: 'Allison',
      ),
      headline2: TextStyle( ///style for items in drawer
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
          color: Colors.black,
          fontSize: 24
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(4, 88, 125, 1),
      // This will control the "back" icon
      iconTheme: IconThemeData(color: Colors.white),
      // This will control action icon buttons that locates on the right
      actionsIconTheme: IconThemeData(color: Color.fromRGBO(4, 88, 125, 1)),
      centerTitle: false,
      elevation: 15,
     /* titleTextStyle: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontFamily: 'Allison',
        fontSize: 40,
      ),*/
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromRGBO(199, 231, 255, 1),

    )
  );
}