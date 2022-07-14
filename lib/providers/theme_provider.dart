import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isOn) {
      themeMode = ThemeMode.dark;
      prefs.setBool('isDarkTheme', true);
    } else {
      themeMode = ThemeMode.light;
      prefs.setBool('isDarkTheme', false);
    }
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    backgroundColor: Colors.grey.shade900,
    primaryColor: Color.fromRGBO(4, 88, 125, 1),
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.white, opacity: 0.8),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(126, 209, 181, 1) /*Color.fromRGBO(4, 88, 125, 1)*/,
      // This will control the "back" icon
      iconTheme: IconThemeData(color: Colors.white/*Color.fromRGBO(98, 94, 215, 1)*/),
      // This will control action icon buttons that locates on the right
      actionsIconTheme: IconThemeData(color: Colors.white/*Color.fromRGBO(4, 88, 125, 1)*/),
      centerTitle: false,
      elevation: 15,
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: Colors.red,
          fontSize: 15),
      bodyText2: TextStyle(
          color: Color.fromRGBO(4, 88, 125, 1),
          fontSize: 15,
          fontWeight: FontWeight.w700),
      headline1: TextStyle(
        ///title in appBar
        color: Colors.white,
        fontSize: 35,
        fontWeight: FontWeight.bold,
        //fontFamily: 'Allison',
      ),
      headline3: TextStyle(
          color: Color.fromRGBO(64, 191, 197, 1),
          fontSize: 20,
          fontWeight: FontWeight.bold),
      headline4: TextStyle(
        color: Color.fromRGBO(199, 193, 255,1),
        fontSize: 17,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: Color.fromRGBO(4, 88, 125, 1),
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Color.fromRGBO(4, 88, 125, 1)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(4, 88, 125, 1),
      // This will control the "back" icon
      iconTheme: IconThemeData(color: Colors.white),

      // This will control action icon buttons that 111111111locates on the right
      actionsIconTheme: IconThemeData(color: Colors.white),
      centerTitle: false,
      elevation: 15,
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: Colors.red,
          fontSize: 15),
      bodyText2: TextStyle(
          color: Color.fromRGBO(4, 88, 125, 1),
          fontSize: 15,
          fontWeight: FontWeight.w700),
      headline1: TextStyle(
        ///title in appBar
        color: Colors.white,
        fontSize: 35,
        fontWeight: FontWeight.bold,
        //fontFamily: 'Allison',
      ),
      ///title in profile
      headline3: TextStyle(
          color: Color.fromRGBO(4, 88, 125, 1),
          fontSize: 20,
          fontWeight: FontWeight.bold),
      ///details in profile
      headline4: TextStyle(
        color: Color.fromRGBO(64, 191, 197, 1),
        fontSize: 17,
      ),
    ),
  );
}
