import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class ProfileScreen extends StatelessWidget {
  final ThemeData profileTheme;
  const ProfileScreen({Key? key,required this.profileTheme}) : super(key: key);
  static const routeName = '/profile_Screen';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: this.profileTheme.backgroundColor,
      drawer: MainDrawer(this.profileTheme),
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}