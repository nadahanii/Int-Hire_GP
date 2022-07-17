import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/notification.dart' as n;
import '../providers/auth.dart';
import 'navbar_screen.dart';

class NotificationDetailedScreen extends StatelessWidget {
  final n.Notification notification;
  const NotificationDetailedScreen({Key? key, required this.notification})
      : super(key: key);
  static const routeName = '/notification_detailed_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NavbarScreen(
                          selected: 1,
                        )));
          },
        ),
        title: Text(
          this.notification.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Provider.of<Auth>(context).userType == "Admin")
              Card(
                child: ListTile(
                  title: Text(
                    'Sent From',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(  this.notification.receiverEmail,
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ),
              ),
            Card(
              child: ListTile(
                title: Text(
                  'Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(  this.notification.date,
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Sender role',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(  this.notification.senderType,
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Title',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(  this.notification.title,
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Body',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(  this.notification.description,
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
