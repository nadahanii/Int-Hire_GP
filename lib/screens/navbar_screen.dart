import 'package:flutter/material.dart';
import 'package:history_feature/screens/job_view.dart';
import 'package:history_feature/screens/notification_page.dart';
import 'package:history_feature/screens/profile_screen.dart';
import 'package:history_feature/screens/settings_page.dart';

class NavbarScreen extends StatelessWidget {
  static const routeName = '/navbar_screen';

  const NavbarScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      ProfileScreen(),
      SettingsPage(),
      NotificationPage(),
      JobView(),
    ];

    return Scaffold();
  }
}
