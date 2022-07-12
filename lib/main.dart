
import 'package:flutter/material.dart';
import 'package:history_feature/models/GlobalTheme.dart';
import 'package:history_feature/providers/auth.dart';
import 'package:history_feature/providers/jobs.dart';
import 'package:history_feature/screens/add_test.dart';
import 'package:history_feature/screens/navbar_screen.dart';
import 'package:history_feature/screens/notification_page.dart';
import 'package:history_feature/screens/settings_page.dart';
import 'package:history_feature/screens/applicant_register_screen.dart';
import 'package:history_feature/screens/job_operations_screen.dart';
import 'package:history_feature/screens/job_view.dart';
import 'package:history_feature/screens/register_screen.dart';
import 'package:history_feature/screens/recruiter_register_screen.dart';
import 'package:history_feature/screens/splash_screen.dart';
import 'package:history_feature/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:history_feature/screens/login_screen.dart';
import 'package:history_feature/models/GlobalTheme.dart';
import 'package:history_feature/screens/forget_password_screen.dart';

import 'screens/history_home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => GlobalTheme()),
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
    final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;
    return Consumer<Auth>(
      builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Int-Hire',
          theme: globalTheme,
          home: SplashScreen(),
          routes: {
            LoginScreen.routeName: (ctx) => LoginScreen(),
            SplashScreen.routeName: (ctx) => SplashScreen(),
            RegisterScreen.routeName: (ctx) => RegisterScreen(),
            JobView.routeName: (ctx) => JobView(),
            add_test.routeName: (ctx) => add_test(),
            JobOperations.routeName: (ctx) => JobOperations(),
            HistoryHomePage.routeName: (ctx) => HistoryHomePage(),
            SettingsPage.routeName: (ctx)=>SettingsPage(),
            NotificationPage.routeName:(ctx)=>NotificationPage(notificationTheme: globalTheme,), ///necessary to send the theme to this page
            ForgotPassword.routeName:(ctx)=>ForgotPassword(),
            NavbarScreen.routeName:(ctx)=>NavbarScreen(),
            applicant_register_screen.routeName: (ctx) => applicant_register_screen(),
            recruiter_register_screen.routeName: (ctx) => recruiter_register_screen(),
            ProfileScreen.routeName: (ctx) => ProfileScreen(),
          },
        ),
    );
  }
}
