import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key,}) : super(key: key);
  static const routeName = '/profile_Screen';
  //static const routeName = '/GetUserInfo';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}