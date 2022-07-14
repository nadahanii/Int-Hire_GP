import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/models/job.dart';
import 'package:history_feature/providers/Notifications.dart';
import 'package:history_feature/models/GlobalTheme.dart';
import 'package:history_feature/providers/auth.dart';
import 'package:history_feature/providers/jobs.dart';
import 'package:history_feature/screens/add_test.dart';
import 'package:history_feature/screens/edit_profile.dart';
import 'package:history_feature/screens/notification_page.dart';
import 'package:history_feature/screens/profile_screen_recruiter.dart';
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
    ChangeNotifierProvider(create: (_) => Notifications()),
    ChangeNotifierProxyProvider<Auth, Jobs>(
      update: (context, value, previous) => Jobs(value),
      create: (context) => Jobs(Provider.of<Auth>(context, listen: false)),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final ApplicantUser userr = new ApplicantUser(name: 'magda', email: 'magda@yaho.com', phoneNumber: '01159502557', password: 'Helloworld0@', street: 'shhh', city: 'giza', country: 'cairo', educationLevel: Education.Bachelors, militaryStatus: MilitaryStatus.Postponed, birthDay: '8/13/2000', isMale: false, tags: ['hi' , 'hello']);


  @override
  Widget build(BuildContext context) {
    final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;
    return Consumer<Auth>(
      builder: (ctx, auth, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Int-Hire',
        theme: globalTheme,
        home: auth.isAuth
            ? JobView(history: false)
            : FutureBuilder(
                future: auth.tryAutoLogin(),
                builder: (ctx, authResultSnapshot) =>
                    authResultSnapshot.connectionState ==
                            ConnectionState.waiting
                        ? SplashScreen()
                        : ProfileScreen(user: userr)),

        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SplashScreen.routeName: (ctx) => SplashScreen(),
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
          JobView.routeNameForView: (ctx) => JobView(history: false),
          JobView.routeNameForHistory: (ctx) => JobView(history: true),
          AddTest.routeName: (ctx) => AddTest(),
          JobOperations.routeName: (ctx) => JobOperations(),
          SettingsPage.routeName: (ctx) => SettingsPage(),
          NotificationPage.routeName: (ctx) => NotificationPage(),
          ForgotPassword.routeName: (ctx) => ForgotPassword(),
          ApplicantRegisterScreen.routeName: (ctx) => ApplicantRegisterScreen(),
          RecruiterRegisterScreen.routeName: (ctx) => RecruiterRegisterScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(user: userr,),
          EditProfilePage.routeName: (ctx) => EditProfilePage(),
          ProfileScreenRec.routeName : (ctx) => ProfileScreenRec()
        },
      ),
    );
  }
}
