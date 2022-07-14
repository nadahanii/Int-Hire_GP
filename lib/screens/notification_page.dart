import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/notifications.dart';
import '../widgets/notifications_list.dart';
import 'complain_form.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);
  static const routeName = '/Notifications';

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
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
        title:
            Text('Notifications', style: Theme.of(context).textTheme.headline1),
      ),
      body: FutureBuilder(
        future: Provider.of<Notifications>(context, listen: false).userType !=
                "Admin"
            ? Provider.of<Notifications>(context, listen: false)
                .fetchAndSetNotifications()
            : Provider.of<Notifications>(context, listen: false)
                .fetchAndSetComplaint(),
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
