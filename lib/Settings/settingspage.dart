import 'package:flutter/material.dart';

class Settings_Page extends StatefulWidget {
  @override
  State<Settings_Page> createState() => _Settings_PageState();
}

class _Settings_PageState extends State<Settings_Page> {
  late bool isDark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('Settings',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 2.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        child:Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child:InkWell(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(7.0, 0, 8.0, 0),
                          child: Image.asset(
                            'assets/globe.png',
                          ),
                        ),
                        Text(
                          'Language',
                          style: TextStyle(
                              fontSize: 22),
                          textAlign: TextAlign.start,
                        ),

                      ],
                    ),
                    onTap: Languagechange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(7.0, 0, 8.0, 0),
                        child: Image.asset(
                          'assets/night_mode.png',

                        ),
                      ),
                      Text(
                        'Theme',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.start,
                      ),

                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(7.0, 0, 8.0, 0),
                      child: Image.asset(
                        'assets/help-.png',
                        scale:0.6,
                      ),
                    ),
                    Text(
                      'Help',
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.start,
                    ),
                  ],
                )
              ],

            )
          ],
        ),
      ),
    );
  }
  void Languagechange(){
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70),
                topRight: Radius.circular(70)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  child: Text(
                    ' اللغة العربية',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  child: Text(
                    'English language',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),

                ),
              )
            ],
          ),

        ));
  }}