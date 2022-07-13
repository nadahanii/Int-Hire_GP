import 'package:flutter/material.dart';
import '../models/notification.dart' as n;
class NotificationDetailedScreen extends StatelessWidget {
  final n.Notification notification;
  const NotificationDetailedScreen({Key? key,required this.notification}) : super(key: key);
  static const routeName = '/notification_detailed_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(this.notification.title,
        style: Theme.of(context).textTheme.headline1,
        ),
      ),

    );
  }
}
