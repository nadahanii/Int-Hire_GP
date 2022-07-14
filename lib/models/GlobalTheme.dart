import 'package:flutter/material.dart';

class GlobalTheme with ChangeNotifier {
  final globalTheme = ThemeData(
      primarySwatch: Colors.blueGrey,
      backgroundColor: Colors.white,
      //Color.fromRGBO(199, 231, 255, 1),

      //buttonColor: Color.fromRGBO(4,88,125,1) ,
      textTheme: const TextTheme(
        labelMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.red,
            fontSize: 15),
        bodyText2: TextStyle(
            color: Color.fromRGBO(4, 88, 125, 1),
            fontSize: 15,
            fontWeight: FontWeight.w700),
        caption: TextStyle(

            ///items in settings_page
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
            color: Colors.black,
            fontSize: 20),
        headline1: TextStyle(
          ///title in appBar
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          //fontFamily: 'Allison',
        ),
        headline2: TextStyle(

            ///style for items in drawer
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
            color: Colors.black,
            fontSize: 24),
        headline3: ///labels in profile
            TextStyle(color: Color.fromRGBO(4, 88, 125, 1), fontSize: 20,fontWeight: FontWeight.bold),
        headline4: TextStyle(
          color: Color.fromRGBO(64, 191, 197,1),
            fontSize: 18,
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
      ));
}
