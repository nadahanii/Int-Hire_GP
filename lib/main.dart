import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/models/job.dart';
import 'package:history_feature/providers/auth.dart';
import 'package:history_feature/providers/jobs.dart';
import 'package:history_feature/providers/notifications.dart';
import 'package:history_feature/providers/theme_provider.dart';
import 'package:history_feature/screens/add_test.dart';
import 'package:history_feature/screens/edit_password_screen.dart';
import 'package:history_feature/screens/edit_profile.dart';
import 'package:history_feature/screens/notification_page.dart';
import 'package:history_feature/screens/profile_screen_recruiter.dart';
import 'package:history_feature/screens/recruiter_result_screen.dart';
import 'package:history_feature/screens/settings_page.dart';
import 'package:history_feature/screens/job_operations_screen.dart';
import 'package:history_feature/screens/job_view.dart';
import 'package:history_feature/screens/register_screen.dart';
import 'package:history_feature/screens/splash_screen.dart';
import 'package:history_feature/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:history_feature/screens/login_screen.dart';
import 'package:history_feature/screens/forget_password_screen.dart';
import 'package:history_feature/models/recruiter_user.dart';
import 'package:history_feature/models/company.dart';
import 'package:history_feature/screens/edit_profile_recruiter.dart';
import 'package:history_feature/models/applicant_data_for_result.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => Auth()),
    ChangeNotifierProxyProvider<Auth, Notifications>(
      update: (context, value, previous) => Notifications(value),
      create: (context) =>
          Notifications(Provider.of<Auth>(context, listen: false)),
    ),
    ChangeNotifierProxyProvider<Auth, Jobs>(
      update: (context, value, previous) => Jobs(value),
      create: (context) => Jobs(Provider.of<Auth>(context, listen: false)),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final Company _companyy = new Company(id: 1, name: 'Valeo', description: 'hello world ana asmy magda', street: 'ahmed', city: 'alex', country: 'egypt');
  final ApplicantUser applicant = new ApplicantUser(
      name: 'magda',
      email: 'magda@yaho.com',
      phoneNumber: '01159502557',
      password: 'Helloworld0@',
      street: 'shhh',
      city: 'giza',
      country: 'cairo',
      educationLevel: Education.Bachelors,
      militaryStatus: MilitaryStatus.Postponed,
      birthDay: '08/12/2000',
      isMale: false,
      Skills: 'i can read and write',
      tags: ['hi', 'hello']);
  late  RecruiterUser recruiter = new RecruiterUser(
      name: 'magda',
      email: 'magda@yaho.com',
      phoneNumber: '01159502557',
      password: 'Helloworld0@',
      street: 'ahmed orabii',
      city: 'giza',
      country: 'cairo',
      birthDay: '08/12/2000',
      isMale: false,
      position: 'HR',
      company: _companyy,

  );
  late ApplicantResInfo infoApplicant1 = new ApplicantResInfo(
    name: 'magda',
    personality_type: 'ENFJ',
    kindred_spirits: ['ahmed ', 'mohamed'],
    intriguing_differences: ['ali ', 'youssef'],
    challenging_opposites: ['omar ', 'saeed'],
    potential_complements: ['hossam ', 'nada'],
  );
  late ApplicantResInfo infoApplicant2 = new ApplicantResInfo(
    name: 'nada',
    personality_type: 'MNBA',
    kindred_spirits: ['Magda ', 'loa'],
    intriguing_differences: ['alaa ', 'hello'],
    challenging_opposites: ['eeee ', 'eeee'],
    potential_complements: ['dddd ', 'dd'],
  );
  late ApplicantResInfo infoApplicant3 = new ApplicantResInfo(
    name: 'hossam',
    personality_type: 'eeeee',
    kindred_spirits: ['eee ', 'ee'],
    intriguing_differences: ['eee ', 'eeeeee'],
    challenging_opposites: ['ppp ', 'opo'],
    potential_complements: ['mxmmx ', 'ddd'],
  );
  late List <ApplicantResInfo> listt=<ApplicantResInfo>[];
   void assignlist()
   {
     listt.add(infoApplicant1);
     listt.add(infoApplicant2);
     listt.add(infoApplicant3);

   }






  @override
  Widget build(BuildContext context) {
    //final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;
    final themeProvider = Provider.of<ThemeProvider>(context);
    assignlist();
    return Consumer<Auth>(
      builder: (ctx, auth, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Int-Hire',
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: auth.isAuth
            ? JobView(history: false)
            : FutureBuilder(
                future: auth.tryAutoLogin(),
                builder: (ctx, authResultSnapshot) =>
                    authResultSnapshot.connectionState ==
                            ConnectionState.waiting
                        ? CircularProgressIndicator()
                        : RecruiterResScreen(ListOfApplicants: listt,)),
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
          ProfileScreen.routeName: (ctx) => ProfileScreen(
                user: applicant,
              ),
          EditProfilePage.routeName: (ctx) => EditProfilePage(),
          EditPasswordScreen.routeName : (ctx) => EditPasswordScreen(),
          ProfileRecScreen.routeName: (ctx) => ProfileRecScreen(
           user: recruiter
          ),
          EditProfileRecPage.routeName: (ctx) => EditProfileRecPage(),

          RecruiterResScreen.routeName: (ctx) => RecruiterResScreen(  ListOfApplicants: listt,
      )
        },
      ),
    );
  }
}
