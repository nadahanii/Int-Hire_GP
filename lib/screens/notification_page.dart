import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/notifications.dart';
import '../widgets/main_drawer.dart';
import '../widgets/notifications_list.dart';
import 'complain_form.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);
  static const routeName = '/Notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      //drawer: MainDrawer(),
      appBar: AppBar(
        actions: [
            IconButton(
              icon: Icon(Icons.add),
              color: Theme.of(context).bottomAppBarColor,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return ComplaintForm();
                }));
              },
            )
        ],
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 0),
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Container(
          height: 40.0,
          child: TextField(
            decoration: InputDecoration(
              // constraints: BoxConstraints(
              //   minHeight: 40.0,
              //   maxHeight: 40.0,
              // ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 14),
            ),
          ),
        ),
        leadingWidth: 130.0,
      ),
      body: FutureBuilder(
        future: Provider.of<Notifications>(context, listen: false).userType != "Admin" ?Provider.of<Notifications>(context, listen: false)
            .fetchAndSetNotifications() : Provider.of<Notifications>(context, listen: false).fetchAndSetComplaint(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<Notifications>(
                builder: (_, cart, ch) => NotificationsList(),
              );
            }
          }
        },
      ),
    );
  }
}
