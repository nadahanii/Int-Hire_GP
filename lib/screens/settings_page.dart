import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Settings_page extends StatefulWidget{
  static const routeName = '/Settings';

  @override
  State<Settings_page> createState() => _Settings_pageState();
}

class _Settings_pageState extends State<Settings_page> {

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
            color:Colors.green,
          )
        ),
      ),
      body:Container(
        padding: EdgeInsets.only(left: 16,top: 25,right: 16),
        child:Center(
          child: ListView(
            children: [
              Text(
                "Settings",
                style:TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
              ),
              Divider(height: 10,thickness: 10),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  showDialog(context: context,
                      builder: (BuildContext context){
                       return AlertDialog(
                         title:Text("Language",
                           style:TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                         content:Column(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                              Text("English",
                              style:TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                             Text("Arabic",
                               style:TextStyle(
                                   fontSize: 15,
                                   fontWeight: FontWeight.w500
                               ),
                             ),
                           ],
                         ),
                         actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"))
                         ],
                       );
                      }
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Language",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Theme",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  Transform.scale(
                    scale:0.7,
                    child: CupertinoSwitch(value:true,
                      onChanged: (bool val){},
                    ),
                  )
                ],
              )
            ],

          ),
        )
      )


    );

  }
}