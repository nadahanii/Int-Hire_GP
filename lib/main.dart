import 'package:flutter/material.dart';
import 'package:history_feature/providers/Notifications.dart';
import 'package:history_feature/models/GlobalTheme.dart';
import 'package:history_feature/providers/auth.dart';
import 'package:history_feature/providers/jobs.dart';
import 'package:history_feature/screens/add_test.dart';
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
import 'package:history_feature/screens/forget_password_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => GlobalTheme()),
    ChangeNotifierProvider(create: (_) => Auth()),
    ChangeNotifierProvider(create: (_) => Jobs()),
    ChangeNotifierProvider(create: (_) => Notifications()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;
    return Consumer<Auth>(
      builder: (ctx, auth, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Int-Hire',
        theme: globalTheme,
        home: auth.token != null ? JobView(jobTheme: globalTheme) :LoginScreen(
          loginTheme: globalTheme,
        ),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(
                loginTheme: globalTheme,
              ),
          SplashScreen.routeName: (ctx) => SplashScreen(
                SplashTheme: globalTheme,
              ),
          RegisterScreen.routeName: (ctx) => RegisterScreen(
                registerTheme: globalTheme,
              ),
          JobView.routeNameForView: (ctx) =>
              JobView(history: false, jobTheme: globalTheme),
          JobView.routeNameForHistory: (ctx) =>
              JobView(history: true, jobTheme: globalTheme),
          AddTest.routeName: (ctx) => AddTest(),
          JobOperations.routeName: (ctx) => JobOperations(),
          SettingsPage.routeName: (ctx) =>
              SettingsPage(settingsTheme: globalTheme),
          NotificationPage.routeName: (ctx) =>
              NotificationPage(notificationTheme: globalTheme),
          ForgotPassword.routeName: (ctx) =>
              ForgotPassword(registerTheme: globalTheme),
          ApplicantRegisterScreen.routeName: (ctx) =>
              ApplicantRegisterScreen(registerTheme: globalTheme),
          RecruiterRegisterScreen.routeName: (ctx) =>
              RecruiterRegisterScreen(registerTheme: globalTheme),
          ProfileScreen.routeName: (ctx) =>
              ProfileScreen(profileTheme: globalTheme),
        },
      ),
    );
  }
}
