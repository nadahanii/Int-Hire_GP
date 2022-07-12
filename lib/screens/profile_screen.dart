import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key,}) : super(key: key);
  static const routeName = '/profile_Screen';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: MainDrawer(this.profileTheme),
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}