import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/notifications.dart';
import 'notification_item.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<Notifications>(context).items;
    return ListView.separated(
      itemBuilder: (context, index) {
        return NotificationItem(notification: notifications[index],);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 0,
        );
      },
      itemCount: notifications.length,
    );
  }
}