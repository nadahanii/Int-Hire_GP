import 'package:flutter/material.dart';
import 'package:history_feature/models/admin_user.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/models/recruiter_user.dart';
import 'package:history_feature/screens/job_view.dart';
import 'package:history_feature/screens/notification_page.dart';
import 'package:history_feature/screens/profile_screen.dart';
import 'package:history_feature/screens/profile_screen_admin.dart';
import 'package:history_feature/screens/profile_screen_recruiter.dart';
import 'package:history_feature/screens/settings_page.dart';
import 'package:provider/provider.dart';
import '../models/job.dart';
import '../providers/auth.dart';

class NavbarScreen extends StatefulWidget {
  static const routeName = '/navbar_screen';
  int selected;
  NavbarScreen({Key? key, this.selected = 0}) : super(key: key);

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  /*final ApplicantUser applicant3 = new ApplicantUser(
      name: 'Nada Hani',
      email: 'nadahani24@gmail.com',
      phoneNumber: '01112334556',
      password: 'Helloworld0@',
      street: 'Ahmed Orabi st.',
      city: 'Giza',
      country: 'Egypt',
      educationLevel: Education.Bachelors,
      militaryStatus: MilitaryStatus.NotApplicable,
      birthDay: '05/12/2000',
      isMale: false,
      skills: 'competitive programming \n, problem solving',
      twitterUsername: 'Nadahanii',
      tags: ['C++', 'Java','Python']);*/

  void IconTap(int index) {
    setState(() {
      widget.selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      JobView(history: false),
      NotificationPage(),
      /*JobView(history: true,),
      ProfileScreen(user: applicant3,),*/

      if (Provider.of<Auth>(context).userType != 'Admin')
        JobView(
          history: true,
        ),
      if (Provider.of<Auth>(context).userType == 'Applicant')
        ProfileScreen(
            user: Provider.of<Auth>(context).userObject as ApplicantUser),
      if (Provider.of<Auth>(context).userType == 'Recruiter')
        ProfileRecScreen(
            user: Provider.of<Auth>(context).userObject as RecruiterUser),
      if (Provider.of<Auth>(context).userType == 'Admin')
        ProfileAdminScreen(
            user: Provider.of<Auth>(context).userObject as AdminUser),
     // SettingsPage(), ///profile btefta7 de 3ashan hwa wala user mn dool (kol el if be false)
      SettingsPage()
    ];

    return Scaffold(
      body: Center(
        child: _pages.elementAt(widget.selected),
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
        unselectedItemColor: Color.fromRGBO(255, 219, 136, 1),
        currentIndex: widget.selected,
        showUnselectedLabels: false,
        onTap: IconTap,
      ),
    );
  }
}
