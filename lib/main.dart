import 'dart:html';

import 'package:flutter/material.dart';
import 'package:history_feature/providers/auth.dart';
import 'package:history_feature/providers/jobs.dart';
import 'package:history_feature/screens/add_test.dart';
import 'package:history_feature/screens/job_operations_screen.dart';
import 'package:history_feature/screens/home_screen.dart';
import 'package:history_feature/screens/login.dart';
import 'package:history_feature/screens/register.dart';
import 'package:history_feature/screens/splash_screen.dart';
import 'package:history_feature/screens/profile_screen.dart';
import 'package:provider/provider.dart';

import 'screens/HistoryHomePage.dart';
import 'screens/job_details.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Auth()),
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return Jobs();
      },
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return Consumer<Auth>(
      builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Personal Expenses',
          theme: theme.copyWith(
            primaryColor: Color(0xFFc7e6ff),
            colorScheme: theme.colorScheme.copyWith(secondary: Color(0xFFc7e6ff)),
          ),
          home: auth.isAuth
              ? Home()
              : FutureBuilder(
            future: auth.tryAutoLogin(),
            builder: (_, authResultSnapshot) =>
            authResultSnapshot.connectionState ==
                ConnectionState.waiting
                ? SplashScreen()
                : LoginScreen(),
          ),
          routes: {
            LoginScreen.routeName: (ctx) => LoginScreen(),
            SplashScreen.routeName: (ctx) => SplashScreen(),
            RegisterScreen.routeName: (ctx) => RegisterScreen(),
            Home.routeName: (ctx) => Home(),
            add_test.routeName: (ctx) => add_test(),
            JobOperations.routeName: (ctx) => JobOperations(),
            HistoryHomePage.routeName: (ctx) => HistoryHomePage(),
            ProfileScreen.routeName: (ctx) => ProfileScreen(),
          },
        ),
    );
  }
}
