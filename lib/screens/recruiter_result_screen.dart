import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/screens/profile_screen.dart';
import '../helpers/components.dart';
import '../models/PersonalityDataClass.dart';
import 'applicant_result_screen.dart';

class RecruiterResScreen extends StatefulWidget {
  static const routeName = '/Recruiter_Res_Screen';
  List<ApplicantUser> ListOfApplicants;
  RecruiterResScreen({Key? key, required this.ListOfApplicants})
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

  late PersonalityData personalityData = PersonalityData.notByName(
      "Architect",
      "Imaginative and strategic thinkers, with a plan for everything.",
      "WHO IS AN ARCHITECT (INTJ)?",
      "Architect (INTJ) Strengths",
      "Professional know-how is often where Architects (INTJs) shine most brilliantly.",
      "What Architects (INTJs) want",
      "An Architect (INTJ) is a person with the Introverted.");

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
                itemBuilder: (_, i) {
                  String? userType =
                      widget.ListOfApplicants[i].socialMediaPersonalityType ??
                          widget.ListOfApplicants[i].testPersonalityType;
                  return Column(
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
                                      builder: (context) => ProfileScreen(
                                          user: widget.ListOfApplicants[i])));
                            }),
                            child: Text(
                              'Name : ' + widget.ListOfApplicants[i].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  //decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                          trailing: Image.asset(
                            'assets/' + (userType ?? "").toLowerCase() + '.png',
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
                                      builder: (context) => ApplicantResult(
                                            personalityData:
                                                mapOfTypes[userType] ??
                                                    personalityData,
                                            personality_type: userType ?? "",
                                          ))); //csv file
                            }),
                            child: Text(
                              'Personality Type : ' + (userType ?? ""),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  //decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                          trailing: Image.asset(
                            'assets/white_image.png',
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
                              (mapOfPersonality[userType]?.kindred_spirits ?? "")
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
                              (mapOfPersonality[userType]?.potential_complements ?? "")
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
                              (mapOfPersonality[userType]?.challenging_opposites ?? "")
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
                              (mapOfPersonality[userType]?.intriguing_differences ?? "")
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', '')
                                  .replaceAll(',', ' -'),
                              style: TextStyle(fontWeight: FontWeight.normal)),
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
