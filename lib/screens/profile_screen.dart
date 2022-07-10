import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/GetUserInfo';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}