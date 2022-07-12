import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SettingsPage extends StatefulWidget{
  //final ThemeData settingsTheme;
  const SettingsPage({Key? key,}) : super(key: key);
  static const routeName = '/Settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:Icon(
            Icons.arrow_back,
            color:Colors.white,
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
                           style: Theme.of(context).textTheme.caption,
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
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 24,
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
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Divider(height: 10, thickness: 10),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Language",
                                style: widget.settingsTheme.textTheme.caption,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "English",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Arabic",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Close"))
                              ],
                            );
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Language",
                          style: widget.settingsTheme.textTheme.caption,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 24,
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
                        style: widget.settingsTheme.textTheme.caption,
                      ),
                      Transform.scale(
                        scale: 0.7,
                        child: CupertinoSwitch(
                          value: true,
                          onChanged: (bool val) {},
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
