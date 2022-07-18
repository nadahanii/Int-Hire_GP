import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../helpers/components.dart';
import '../helpers/pair.dart';
import '../models/applicant_user.dart';
import '../models/job.dart';
import '../providers/auth.dart';

class ApplicantRegisterScreen extends StatefulWidget {
  static const routeName = '/applicant_register_screen';
  ApplicantUser applicantUser;
  ApplicantRegisterScreen({Key? key, required this.applicantUser}) : super(key: key);

  @override
  State<ApplicantRegisterScreen> createState() =>
      _ApplicantRegisterScreenState();
}

class _ApplicantRegisterScreenState extends State<ApplicantRegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _twitterUsernameController = TextEditingController();
  final _skillsController = TextEditingController();
  final _interestedInController = TextEditingController();

  Education _education = Education.Bachelors;

  final List<Pair<String, Education>> _educationList = const [
    Pair('High School', Education.High_School),
    Pair('Bachelor\'s Degree', Education.Bachelors),
    Pair('Master\'s Degree', Education.Masters),
    Pair('Doctorate\'s Degree', Education.Doctorate),
    Pair('Luxurious Degree', Education.Luxurious),
  ];

  MilitaryStatus _militaryStatus = MilitaryStatus.NotApplicable;

  final List<Pair<String, MilitaryStatus>> _militaryStatusList = const [
    Pair('Not Applicable', MilitaryStatus.NotApplicable),
    Pair('Completed', MilitaryStatus.Completed),
    Pair('Exempted', MilitaryStatus.Exempted),
    Pair('Postponed', MilitaryStatus.Postponed),
  ];

  Widget _radioButtonGroup({required String text, required List<Widget> list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(), //(4,88,125,1)
        Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: Color.fromRGBO(4, 88, 125, 1)),
        ),
        ...list,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(top: 70, right: 25, left: 25, bottom: 25),
            child: Column(
              children: <Widget>[
                Text('Applicant Registration',
                    style: GoogleFonts.sourceCodePro(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(4, 88, 125, 4))),
                SizedBox(
                  height: 25,
                ),

                TextFormField(
                  controller: _twitterUsernameController,
                  decoration: InputDecoration(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    labelText: 'Twitter username',
                    hintText: 'if you have',
                  ),
                  keyboardType: TextInputType.name,
                ),
                //twitter
                SizedBox(
                  height: 25,
                ),

                TextFormField(
                  controller: _skillsController,
                  decoration: InputDecoration(
                    icon: FaIcon(FontAwesomeIcons.boltLightning),
                    labelText: 'Skills',
                    hintText: 'separated by a comma',
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid skills';
                    }
                    return null;
                  },
                ), //skills
                SizedBox(
                  height: 25,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.interests_rounded),
                    labelText: 'Interested in',
                    hintText: 'separated by comma',
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid values of jobs you are interested in';
                    }
                    return null;
                  },
                  controller: _interestedInController,
                ), //interested
                SizedBox(
                  height: 25,
                ),
                _radioButtonGroup(
                  text: 'Military status',
                  list: _militaryStatusList.map((pair) {
                    return ListTile(
                      title: Text(pair.item1),
                      leading: Radio<MilitaryStatus>(
                        value: pair.item2,
                        groupValue: _militaryStatus,
                        onChanged: (MilitaryStatus? value) {
                          setState(() {
                            _militaryStatus = value!;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 25,
                ),
                _radioButtonGroup(
                  text: 'Education',
                  list: _educationList.map((pair) {
                    return ListTile(
                      title: Text(pair.item1),
                      leading: Radio<Education>(
                        value: pair.item2,
                        groupValue: _education,
                        onChanged: (Education? value) {
                          setState(() {
                            _education = value!;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 25,
                ),
                TextButton.icon(
                  onPressed: (() {

                    var encode = json.encode({
                      "name": widget.applicantUser.name,
                      "email": widget.applicantUser.email,
                      "phoneNumber": widget.applicantUser.phoneNumber,
                      "password": widget.applicantUser.password,
                      "street": widget.applicantUser.street,
                      "city": widget.applicantUser.city,
                      "country": widget.applicantUser.country,
                      "birthDay": widget.applicantUser.birthDay,
                      "gender":
                      widget.applicantUser.isMale == true ? 1 : 0,
                      "militaryStatus": _militaryStatus.index,
                      if(_twitterUsernameController.text.trim() != "")
                        "twitterUsername": _twitterUsernameController.text,
                      "educationLevel": _education.index,
                      "tags": _interestedInController.text.split(','),
                      "skills": _skillsController.text
                    });

                    if (_formKey.currentState!.validate()) {
                      Provider.of<Auth>(context, listen: false)
                          .signup(encode,"Applicant")
                          .then((value) {
                        if (value != 'login successfully') {
                          showToast(text: value, state: ToastStates.ERROR);
                        } else {
                          showToast(
                              text: "register successfully", state: ToastStates.SUCCESS);
                          Navigator.of(context)
                              .pushReplacementNamed('/add_test');
                        }
                      });
                    }
                  }),
                  icon: const Icon(
                    Icons.app_registration,
                    size: 28,
                  ),
                  label: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 35,
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(4, 88, 125, 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
