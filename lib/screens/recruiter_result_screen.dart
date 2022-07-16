import 'package:flutter/material.dart';
import 'package:history_feature/helpers/pair.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/models/applicant_data_for_result.dart';
import 'package:history_feature/screens/view_applicant_profile_screen.dart';
import '../models/PersonalityDataClass.dart';

class RecruiterResScreen extends StatefulWidget {
  static const routeName = '/Recruiter_Res_Screen';
  //final ThemeData registerTheme;
  late PersonalityData personalityData;
  List<Pair<ApplicantUser, ApplicantResInfo>> ListOfApplicants;
  RecruiterResScreen(
      {Key? key, required this.ListOfApplicants, required this.personalityData
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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text('Applicants', style: Theme.of(context).textTheme.headline3),
            SizedBox(
              height: 15.0,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.ListOfApplicants.length,
              itemBuilder: (_, i) => Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, //AxisAlignment.center,
                children: [
                  Card(
                    child: ListTile(
                      leading: TextButton(
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileViewScreen(
                                      user: widget.ListOfApplicants[i])));
                        }),
                        child: Text(
                          'Name : ' + widget.ListOfApplicants[i].item2.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      trailing: Image.asset(
                        'assets/' +
                            widget.ListOfApplicants[i].item2.personality_type
                                .toLowerCase() +
                            '.png',
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: TextButton(
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileViewScreen(
                                      user: widget.ListOfApplicants[i])));
                        }),
                        child: Text(
                          'Personality Type : ' +
                              widget.ListOfApplicants[i].item2.personality_type,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Kindred Spirits',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          widget.ListOfApplicants[i].item2.kindred_spirits
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', '')
                              .replaceAll(',', ' -'),
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Potential Complements',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          widget.ListOfApplicants[i].item2.potential_complements
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', '')
                              .replaceAll(',', ' -'),
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Challenging Opposites',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          widget.ListOfApplicants[i].item2.challenging_opposites
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', '')
                              .replaceAll(',', ' -'),
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Intriguing Differences',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          widget
                              .ListOfApplicants[i].item2.intriguing_differences
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', '')
                              .replaceAll(',', ' -'),
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
