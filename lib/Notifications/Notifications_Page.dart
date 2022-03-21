import 'package:flutter/material.dart';
import 'ComplaintForm_Page.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool showeditbutton=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('Notifications',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),
        ),
        elevation: 0.0,
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              title: Text('Notification',style: TextStyle(fontSize: 20),),
              subtitle: Text(
                'This may include the recruier response wether he rejects or accepts this applicant for a specific job that he has appilied for ans the applicant can reply'
                ,style: TextStyle(fontSize: 13),),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              title: Text('Compliant Status',style: TextStyle(fontSize: 20),),
              subtitle: Text(
                'This Includs The compliant Status that the applicant Have Composed'
                ,style: TextStyle(fontSize: 13),),
            ),
            SizedBox(
              height: 10.0,
            ),




          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder:
              (context)=>ComplaintForm()));
        },
        backgroundColor: Colors.blue[400],
        child:Image.asset(
          'assets/compose.png',
          scale:1.2,
          color: Colors.white,
        ),
      ),
    );
  }

}
