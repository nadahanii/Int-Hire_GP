import 'package:flutter/material.dart';
import '../models/notification.dart' as n;

class NotificationItem extends StatelessWidget {
  final n.Notification notification;
  const NotificationItem({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: notification.viewed ? Colors.redAccent : Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(),
                  timeAndDate(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget prefixIcon() {
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: Icon(Icons.notifications, size: 25, color: Colors.grey.shade700),
    );
  }

  Widget message() {
    double textSize = 14;
    return Container(
        child: RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: notification.title + " ",
              style: TextStyle(
                fontSize: textSize,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: notification.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )));
  }

  Widget timeAndDate() {
    var dateTime = notification.date.split(' ');
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateTime[0],
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            dateTime[1] + ' ' + dateTime[2],
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
