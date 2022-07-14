import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_data_for_result.dart';

class RecruiterResScreen extends StatefulWidget {
  static const routeName = '/Recruiter_Res_Screen';
  //final ThemeData registerTheme;
  List<ApplicantResInfo> ListOfApplicants;
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
      backgroundColor: Color.fromRGBO(4, 88, 125, 1),
      elevation: 0,
      title: Text("Khara 3ala dmagh hossam",
          style: Theme.of(context).textTheme.headline1),
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
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.ListOfApplicants.length,
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
