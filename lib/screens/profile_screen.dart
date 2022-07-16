import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/screens/edit_profile.dart';
import 'package:provider/provider.dart';

import '../helpers/components.dart';
import '../models/PersonalityDataClass.dart';
import '../providers/auth.dart';
import 'applicant_result_screen.dart';

class ProfileScreen extends StatefulWidget {
  ApplicantUser? user;
  ProfileScreen({Key? key, this.user}) : super(key: key);
  static const routeName = '/profile_Screen';
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late PersonalityData personalityData = PersonalityData.notByName(
      "Architect",
      "Imaginative and strategic thinkers, with a plan for everything.",
      "WHO IS AN ARCHITECT (INTJ)?",
      "Architect (INTJ) Strengths",
      "Professional know-how is often where Architects (INTJs) shine most brilliantly.",
      "What Architects (INTJs) want",
      "An Architect (INTJ) is a person with the Introverted.");
  final _tagsController = TextEditingController();
  final _genderController = TextEditingController();
  final _skillsController = TextEditingController();
  final _socialpersonalityController = TextEditingController();
  final _testpersonalityController = TextEditingController();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: Provider.of<Auth>(context).userType != "Applicant" ? true : false,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      title: Text("Profile", style: Theme.of(context).textTheme.headline1),
      actions: [
        if (Provider.of<Auth>(context).userType == "Applicant")
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditProfilePage(user: widget.user)));
            },
          ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _tagsController.text = widget.user!.tags
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll(',', ' -');
      _skillsController.text = widget.user!.skills.replaceAll(',', '-');
      _socialpersonalityController.text =
          widget.user!.socialMediaPersonalityType ?? "";
      _testpersonalityController.text = widget.user!.testPersonalityType ?? "";
      if (widget.user!.isMale) {
        _genderController.text = 'Male';
      }

      if (!widget.user!.isMale) {
        _genderController.text = "Female";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, //AxisAlignment.center,
              children: [
                Card(
                  child: ListTile(
                    title: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user!.name,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user!.email,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Phone',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user!.phoneNumber,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Birthday',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user!.birthDay,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Street',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user!.street,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'City',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user!.city,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Country',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user!.country,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Education Level',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user!.educationLevel.name,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                if (widget.user!.socialMediaPersonalityType != null)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApplicantResult(
                                    personality_type:
                                        _socialpersonalityController.text,
                                    personalityData: mapOfTypes[
                                            _socialpersonalityController
                                                .text] ??
                                        personalityData,
                                  )));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          'Social Personality Type',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(_socialpersonalityController.text,
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                if (widget.user!.testPersonalityType != null)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApplicantResult(
                                    personality_type:
                                        _testpersonalityController.text,
                                    personalityData: mapOfTypes[
                                            _testpersonalityController.text] ??
                                        personalityData,
                                  )));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          'Test Personality Type',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(_testpersonalityController.text,
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Military Status',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user!.militaryStatus.name,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Gender',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_genderController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                if (widget.user!.twitterUsername != "")
                  Card(
                    child: ListTile(
                      title: Text(
                        'Twitter name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(widget.user!.twitterUsername,
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                  ),
                Card(
                    child: ListTile(
                        title: Text(
                          'Tags',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _tagsController.text,
                        ))),
                Card(
                    child: ListTile(
                        title: Text(
                          'Skills',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _skillsController.text,
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
