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
      body: Padding(
        padding: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text('Sent to:  ',style: Theme.of(context).textTheme.headline3,),
                Text(this.notification.receiverEmail,style: Theme.of(context).textTheme.headline4,)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('Date:  ',style: Theme.of(context).textTheme.headline3,),
                Text(this.notification.date,style: Theme.of(context).textTheme.headline4,)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('Sent from a(n):  ',style: Theme.of(context).textTheme.headline3,),
                Text(this.notification.senderType,style: Theme.of(context).textTheme.headline4,)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('Body:  ',style: Theme.of(context).textTheme.headline3,),
                Text(this.notification.description,style: Theme.of(context).textTheme.headline4,)
              ],
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),

    );
  }
}
