import 'package:flutter/material.dart';

import 'package:history_feature/screens/job_view.dart';
import 'package:history_feature/screens/notification_page.dart';
import 'package:history_feature/screens/profile_screen.dart';
import 'package:history_feature/screens/settings_page.dart';



class NavbarScreen extends StatefulWidget {
  static const routeName = '/navbar_screen';

  const NavbarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selected = 0;

  void IconTap(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      JobView(),
      NotificationPage(),
      JobView(history: true,),
      ProfileScreen(isApplicant: true),
      SettingsPage(),
    ];

    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selected),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconSize: 10,
        items: [
          BottomNavigationBarItem(
              icon: new SizedBox(
                  height: 30,
                  child: Icon(
                    Icons.home,
                    size: 30,
                  )),
              activeIcon: new SizedBox(
                  height: 30,
                  child: Icon(
                    Icons.home_outlined,
                    size: 30,
                  )),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: new SizedBox(
                  height: 30,
                  child: Icon(
                    Icons.notifications_active,
                    size: 30,
                  )),
              activeIcon: new SizedBox(
                  height: 30,
                  child: Icon(
                    Icons.notifications_active_outlined,
                    size: 30,
                  )),
              label: 'Notifications'),
          BottomNavigationBarItem(
              icon: new SizedBox(
                  height: 30,
                  child: Icon(
                    Icons.history,
                    size: 30,
                  )),
              activeIcon: new SizedBox(
                  height: 30,
                  child: Icon(
                    Icons.history_outlined,
                    size: 30,
                  )),
              label: 'History'),
          BottomNavigationBarItem(
              icon: new SizedBox(
                  height: 30,
                  child: Icon(
                    Icons.person,
                    size: 30,
                  )),
              activeIcon: new SizedBox(
                  height: 30,
                  child: Icon(
                    Icons.person_outline,
                    size: 30,
                  )),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: new SizedBox(
                  height: 30,
                  child: Icon(
                    Icons.settings_applications,
                    size: 30,
                  )),
              activeIcon: new SizedBox(
                  height: 30,
                  child: Icon(
                    Icons.settings_applications_outlined,
                    size: 30,
                  )),
              label: 'Settings'),
        ],
        fixedColor: Colors.white,
        currentIndex: _selected,
        showUnselectedLabels: false,
        onTap: IconTap,
      ),
    );
  }
}
