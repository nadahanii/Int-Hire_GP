import 'package:flutter/material.dart';
import 'package:history_feature/providers/jobs.dart';
import 'package:history_feature/screens/job_operations_screen.dart';
import 'package:history_feature/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'HistoryHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return Jobs();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Home(),
      ),
    );
  }
}
