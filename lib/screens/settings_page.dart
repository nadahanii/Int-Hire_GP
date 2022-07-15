import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:history_feature/screens/header_page.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../widgets/icon_widget.dart';

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
                  profile(),
                  SizedBox(height: 10),
                  buildLogout(),
                  SizedBox(height: 10),
                  buildDeleteAccount(),
                  SizedBox(height: 10),
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
          showSnackBar(context, 'Clicked Profile');
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
  Widget buildDeleteAccount() => SimpleSettingsTile(
        title: 'Delete Account',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.delete,
          color: Colors.pink,
        ),
        onTap: () => showSnackBar(context, 'Clicked logout'),
      );
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

/*class SettingsPage extends StatefulWidget {
  //final ThemeData settingsTheme;
  SettingsPage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/Settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkTheme = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headline1,
        ),
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // elevation: 1,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: Colors.white,
        //     )),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Center(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Theme",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: isDarkTheme,
                      onChanged: (bool val) {
                        setState(() {
                          isDarkTheme = val;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/splash_screen');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Logout",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Icon(Icons.logout),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
