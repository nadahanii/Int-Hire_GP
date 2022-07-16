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
          children: [
            if (Provider.of<Auth>(context).userType == "Admin")
              Row(
                children: [
                  Text(
                    'Sent from:  ',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    this.notification.receiverEmail,
                    style: Theme.of(context).textTheme.headline4,
                  )
                ],
              ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Date:  ',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  this.notification.date,
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Sender role:  ',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  this.notification.senderType,
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Title:  ',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  this.notification.title,
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Body:  ',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  this.notification.description,
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
