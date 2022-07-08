import 'package:flutter/material.dart';

import 'complain_form.dart';
class Notification_page extends StatelessWidget{
  const Notification_page({Key? key}) : super(key: key);
  static const routeName = '/Notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon:Icon(
              Icons.arrow_back,
              color:Colors.blue,
            )
        ),
        title: Text("Notifications",
          style:TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color:Colors.black),
        ),
      ),
      body:listview(),
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
  Widget listview() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return listviewitem(index);
      },
      separatorBuilder: (context, index) {
        return Divider(height: 0,);
      },
      itemCount: 15,
    );
  }
    Widget listviewitem(int index){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 13,vertical: 10),
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
                    message(index),
                    timeAndDate(index),
                  ],
                ),
              ),
            ),
          ],

        ),
      );

  }
  Widget prefixIcon(){
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: Icon(Icons.notifications,size: 25,color: Colors.grey.shade700),
    );
  }
  Widget message(int index){
    double Textsize=14;
    return Container(
      child:RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text:TextSpan(
          text: 'Message  ',
          style: TextStyle(
            fontSize:Textsize,
            color:Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text:'Message Description',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        )
      )
    );
  }
  Widget timeAndDate(int index){
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '23-01-2021',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '02:10 AM',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

}