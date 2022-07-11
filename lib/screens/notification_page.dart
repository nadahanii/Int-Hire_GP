import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:history_feature/widgets/notification_item.dart';
import 'package:provider/provider.dart';

import '../providers/Notifications.dart';
import '../widgets/main_drawer.dart';
import 'complain_form.dart';

class NotificationPage extends StatelessWidget {
    final ThemeData notificationTheme;
  const NotificationPage({Key? key,required this.notificationTheme}) : super(key: key);
  static const routeName = '/Notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(notificationTheme),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.comment),
            padding: EdgeInsets.only(right: 5.0),
            tooltip: "complaint",
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ComplaintForm(complaintTheme: notificationTheme,)));
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
              constraints: BoxConstraints(maxHeight: 40, minHeight: 40,),
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
        future: Provider.of<Notifications>(context, listen: false).fetchAndSetNotifications(),
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
                builder: (_, cart, ch) {
                  final notifications = Provider.of<Notifications>(context, listen: false).items;
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
                },
              );
            }
          }
        },
      ),
    );
  }
}
