import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:history_feature/screens/header_page.dart';
import 'package:provider/provider.dart';

import '../models/applicant_user.dart';
import '../models/recruiter_user.dart';
import '../providers/auth.dart';
import '../widgets/icon_widget.dart';
import 'edit_profile.dart';
import 'edit_profile_recruiter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/Settings';
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(24),
            children: [
              HeaderPage(),
              SizedBox(height: 10),
              SettingsGroup(
                title: 'GENERAL',
                children: <Widget>[
                  if(Provider.of<Auth>(context, listen: false).userType != 'Admin')
                  profile(),
                  SizedBox(height: 10),
                  buildLogout(),
                  SizedBox(height: 10),
                  //buildDeleteAccount(),
                  //SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ));
  }

  Widget profile() => SimpleSettingsTile(
        title: 'Edit Profile',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.person,
          color: Colors.green,
        ),
        onTap: () {
          /* if (Provider.of<Auth>(context).userType == 'Applicant')
            ProfileScreen(
                user: Provider.of<Auth>(context).userObject as ApplicantUser);
          if (Provider.of<Auth>(context).userType == 'Recruiter')
          ProfileRecScreen(
          user: Provider.of<Auth>(context).userObject as RecruiterUser);
          if (Provider.of<Auth>(context).userType == 'Admin')
          ProfileAdminScreen(
          user: Provider.of<Auth>(context).userObject as AdminUser);*/
          if(Provider.of<Auth>(context, listen: false).userType == 'Applicant')
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EditProfilePage(user: (Provider.of<Auth>(context, listen: false).userObject as ApplicantUser))));
          else if(Provider.of<Auth>(context, listen: false).userType == 'Recruiter')
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EditProfileRecPage(user: (Provider.of<Auth>(context, listen: false).userObject as RecruiterUser))));


        },
      );
  Widget buildLogout() => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.logout,
          color: Colors.blueAccent,
        ),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/');
          Provider.of<Auth>(context, listen: false).logout();
        },
      );
  /*Widget buildDeleteAccount() => SimpleSettingsTile(
        title: 'Delete Account',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.delete,
          color: Colors.pink,
        ),
        onTap: () => showSnackBar(context, 'Clicked logout'),
      );*/
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    ),
  );
}
