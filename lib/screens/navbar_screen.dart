import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';

import 'package:history_feature/screens/job_view.dart';
import 'package:history_feature/screens/notification_page.dart';
import 'package:history_feature/screens/profile_screen.dart';
import 'package:history_feature/screens/settings_page.dart';
import 'package:provider/provider.dart';

import '../models/job.dart';
import '../providers/auth.dart';

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
    final ApplicantUser userr = new ApplicantUser(
        name: 'magda',
        email: 'magda@yaho.com',
        phoneNumber: '01159502557',
        password: 'Helloworld0@',
        street: 'shhh',
        city: 'giza',
        country: 'cairo',
        educationLevel: Education.Bachelors,
        militaryStatus: MilitaryStatus.Postponed,
        birthDay: '08/12/2000',
        skills: "dsdsa,adsd,asdas",
        isMale: false,
        tags: ['hi', 'hello']);
    List<Widget> _pages = <Widget>[
      JobView(history: false),
      NotificationPage(),
      if (Provider.of<Auth>(context).userType != 'Admin')
        JobView(
          history: true,
        ),
      ProfileScreen(user: userr),
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
          if (Provider.of<Auth>(context).userType != 'Admin')
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
