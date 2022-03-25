import 'package:flutter/material.dart';
import 'package:history_feature/screens/home_screen.dart';

import '../HistoryHomePage.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, void Function()? tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
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
            color: Theme.of(context).primaryColor,
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
          buildListTile('Home', Icons.home, () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
              return Home();
            }));
          }),
          buildListTile('History', Icons.history, () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
              return HistoryHomePage();
            }));
          }),
          buildListTile('Notification', Icons.notifications, () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
              return Home();
            }));
          }),
          buildListTile('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
              return Home();
            }));
          }),
          Spacer(),
          buildListTile('logout', Icons.logout, () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
              return Home();
            }));
          }),
        ],
      ),
    );
  }
}
