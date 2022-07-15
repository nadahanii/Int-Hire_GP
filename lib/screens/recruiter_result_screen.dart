import 'package:flutter/material.dart';

import 'package:history_feature/helpers/pair.dart';
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

import 'package:history_feature/screens/view_applicant_profile_screen.dart';



class RecruiterResScreen extends StatefulWidget {
  static const routeName = '/Recruiter_Res_Screen';
  //final ThemeData registerTheme;
  List<Pair<ApplicantUser, ApplicantResInfo>> ListOfApplicants;
  RecruiterResScreen({Key? key, required this.ListOfApplicants
      /* required this.registerTheme*/
      })
      : super(key: key);

  @override
  State<RecruiterResScreen> createState() => _RecruiterResScreenState();
}

class _RecruiterResScreenState extends State<RecruiterResScreen> {
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(),
      centerTitle: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,

      title: Text("Results ", style: Theme.of(context).textTheme.headline1),

    );
  }

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(widget.ListOfApplicants.length);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Applicants', style: Theme.of(context).textTheme.headline3),
            SizedBox(
              height: 15.0,
            ),

            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.ListOfApplicants.length,

                itemBuilder: (_, i) => Row(children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, //AxisAlignment.center,
                        children: [
                          Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '    Name : ',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileViewScreen(
                                                      user: widget
                                                              .ListOfApplicants[
                                                          i])));
                                    }),
                                    child: Text(
                                      widget.ListOfApplicants[i].item2.name,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(64, 191, 197, 1),
                                          fontSize: 17,
                                          decoration: TextDecoration.underline),
                                    ))
                              ]),
                          Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '    Personality Type : ',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileViewScreen(
                                                      user: widget
                                                              .ListOfApplicants[
                                                          i])));
                                    }),
                                    child: Text(
                                      widget.ListOfApplicants[i].item2
                                          .personality_type,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(64, 191, 197, 1),
                                          fontSize: 17,
                                          decoration: TextDecoration.underline),
                                    ))
                              ]),
                          Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '    Kindred Spirits : ',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                Text(
                                  widget
                                      .ListOfApplicants[i].item2.kindred_spirits
                                      .toString(),
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ]),
                          const SizedBox(height: 15),
                          Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '    Potential Complements : ',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                Text(
                                  widget.ListOfApplicants[i].item2
                                      .potential_complements
                                      .toString(),
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ]),
                          const SizedBox(height: 15),
                          Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '    Challenging Opposites : ',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                Text(
                                  widget.ListOfApplicants[i].item2
                                      .challenging_opposites
                                      .toString(),
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ]),
                          const SizedBox(height: 15),
                          Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '    Intriguing Differences : ',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                Text(
                                  widget.ListOfApplicants[i].item2
                                      .intriguing_differences
                                      .toString(),
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ]),
                          const SizedBox(height: 20),
                        ],
                      ),
                      Image.asset(
                        'assets/' +
                            widget.ListOfApplicants[i].item2.personality_type
                                .toLowerCase() +
                            '.png',
                        width: 200.0,
                        height: 150.0,
                      ),
                    ])),

                itemBuilder: (_, i) => Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, //AxisAlignment.center,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/Login_Screen');
                              },
                              child: Text(
                                widget.ListOfApplicants[i].name,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Personality Type : ',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                widget.ListOfApplicants[i].personality_type,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ]),
                        const SizedBox(height: 15),
                        Row(
                            children: [
                              Text(
                                'Kindred Spirits : ',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                widget.ListOfApplicants[i].kindred_spirits
                                    .toString(),
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ]),
                        const SizedBox(height: 15),
                        Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Potential Complements : ',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                widget.ListOfApplicants[i].potential_complements
                                    .toString(),
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ]),
                        const SizedBox(height: 15),
                        Row(
                            children: [
                              Text(
                                'Challenging Opposites : ',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                widget.ListOfApplicants[i].challenging_opposites
                                    .toString(),
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ]),
                        const SizedBox(height: 15),
                        Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Intriguing Differences : ',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                widget
                                    .ListOfApplicants[i].intriguing_differences
                                    .toString(),
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ]),
                      ],
                    )),

          ],
        ),
      ),
    );
  }
}
