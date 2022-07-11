import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final ThemeData profileTheme;
  const ProfileScreen({Key? key,required this.profileTheme}) : super(key: key);
  static const routeName = '/profile_Screen';
  //static const routeName = '/GetUserInfo';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: this.profileTheme.backgroundColor,
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}