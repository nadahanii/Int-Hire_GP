import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class MainDrawer extends StatelessWidget {
  final ThemeData drawerTheme;
  MainDrawer( this.drawerTheme);
  Widget buildListTile(String title, IconData icon, void Function()? tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: this.drawerTheme.textTheme.headline2

      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: this.drawerTheme.appBarTheme.backgroundColor,
            child: Text(
              'Profile',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Profile', Icons.person_rounded, () {
            Navigator.of(context).pushReplacementNamed('/profile_Screen');
          }),
          buildListTile('Home', Icons.home, () {
            Navigator.of(context).pushReplacementNamed('/home');
          }),
          buildListTile('History', Icons.history, () {
            Navigator.of(context).pushReplacementNamed('/history');
          }),
          buildListTile('Notification', Icons.notifications, () {
            Navigator.of(context).pushReplacementNamed('/Notifications');
          }),
          buildListTile('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed('/Settings');
          }),
          Spacer(),
          buildListTile('logout', Icons.logout, () {
            Navigator.of(context).pushReplacementNamed('/');
            Provider.of<Auth>(context, listen: false).logout();
          }),
        ],
      ),
    );
  }
}
