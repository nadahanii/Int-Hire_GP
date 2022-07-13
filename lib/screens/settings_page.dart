import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsPage extends StatefulWidget {
  //final ThemeData settingsTheme;
  const SettingsPage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/Settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkTheme = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headline1,
        ),
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // elevation: 1,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: Colors.white,
        //     )),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Center(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Theme",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: isDarkTheme,
                      onChanged: (bool val) {
                        setState(() {
                          isDarkTheme = val;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/profile_Screen');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Text(
                      "Profile",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Icon(
                        Icons.person_rounded
                    ),

                  ],
                ),
              ),
              /*SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed('/Login_Screen');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Text(
                      "Logout",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Icon(
                        Icons.logout
                    ),

                  ],
                ),
              ),*/
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed('/Login_Screen');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Text(
                      "Logout",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Icon(
                        Icons.logout
                    ),

                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
