import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  
  bool get isDarkMode => themeMode==ThemeMode.dark;
  void toggleTheme(bool isOn) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
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
class MyThemes{
  static final darkTheme = ThemeData(
    backgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );


}