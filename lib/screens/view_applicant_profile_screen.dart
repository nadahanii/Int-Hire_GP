import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/screens/edit_profile.dart';
import 'package:history_feature/widgets/profile_widget.dart';
import 'package:history_feature/screens/settings_page.dart';
import '../helpers/pair.dart';
import '../models/applicant_user.dart';
import '../helpers/pair.dart';
import '../models/job.dart';
import 'package:history_feature/models/applicant_data_for_result.dart';

class ProfileViewScreen extends StatefulWidget {
  final Pair<ApplicantUser, ApplicantResInfo> user;
  ProfileViewScreen({Key? key, required this.user}) : super(key: key);
  static const routeName = '/viewprofileApplicant_Screen';
  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  int _gender = 1;
  var genderController = TextEditingController();
  late List<String> tagss;
  late List<String> skilss;
  final _skillsController = TextEditingController();
  final _tagsController = TextEditingController();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(),
      backgroundColor: Color.fromRGBO(4, 88, 125, 1),
      elevation: 0,
      centerTitle: true,
      title: Text("Profile", style: Theme.of(context).textTheme.headline1),
    );
  }

  void assignGender() {
    _skillsController.text = widget.user.item1.skills.replaceAll(',', '-');
    _tagsController.text = widget.user.item1.tags
        .toString()
        .replaceFirst('[', '')
        .replaceFirst(']', '').replaceAll(',', ' -');
    if (widget.user.item1.isMale)
      genderController.text = 'Male';
    else
      genderController.text = 'Female';

  }

  @override
  Widget build(BuildContext context) {
    assignGender();
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
                    subtitle: Text(
                        widget.user.item1.name,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        widget.user.item1.email,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Phone',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                    widget.user.item1.phoneNumber,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Birthday',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        widget.user.item1.birthDay,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Street',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.item1.street,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'City',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.item1.city,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Country',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.item1.country,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Education Level',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.item1.educationLevel.name,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Social Personality Type',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.item1.socialMediaPersonalityType,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Test Personality Type',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.item1.testPersonalityType,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Military Status',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.item1.militaryStatus.name,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Gender',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(genderController.text,
                      style: TextStyle(fontWeight: FontWeight.normal))
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Twitter name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.item1.twitterUsername,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                    child: ListTile(
                        title: Text(
                          'Tags',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                        Text( _tagsController.text,)

                    )),
                Card(
                    child: ListTile(
                        title: Text(
                          'Skills',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                        Text(
                          _skillsController.text,
                        )
                    )),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
