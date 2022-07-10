import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/pair.dart';
import '../models/applicant_user.dart';
import '../models/job.dart';

class applicant_register_screen extends StatefulWidget {
  final ThemeData registerTheme;
  static const routeName = '/applicant_register_screen';
  const applicant_register_screen({Key? key,required this.registerTheme}) : super(key: key);

  @override
  State<applicant_register_screen> createState() => _applicant_register_screenState();
}

class _applicant_register_screenState extends State<applicant_register_screen> {
  final _formKey = GlobalKey<FormState>();
  late String twitterUsername, skills,interestedIn,applicantCity,applicantCountry;

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
        const Divider(),
        Text(
          text,
          style: const TextStyle(fontSize: 20,color: Color.fromRGBO(14, 30, 80, 1)),
        ),
        ...list,
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: widget.registerTheme.backgroundColor,
      body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(top: 70, right: 25, left: 25, bottom: 25),
                child:
                    Column(
                      children: <Widget>[
                        Text(
                          'Applicant Register',
                            style: GoogleFonts.secularOne(fontSize: 50 , fontWeight: FontWeight.w800, color: Color.fromRGBO(4, 88, 125,4))
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: FaIcon(FontAwesomeIcons.twitter),
                            hintText: 'Twitter username ',
                          ),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter valid twitter username';
                            }
                          },
                          onFieldSubmitted: (val) {
                            setState(() {
                              twitterUsername = val;
                              //print(companyName);
                            });
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: FaIcon(FontAwesomeIcons.boltLightning),
                            hintText: 'skills (separated by a comma)',
                          ),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter valid skills';
                            }
                          },
                          onFieldSubmitted: (val) {
                            setState(() {
                              skills = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.interests_rounded),
                            hintText: 'Interested in (if any, separated by comma)',
                          ),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter valid values of jobs you are interested in';
                            }
                          },
                          onFieldSubmitted: (val) {
                            setState(() {
                              interestedIn = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: FaIcon(FontAwesomeIcons.city),
                            hintText: 'City',
                          ),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter valid city';
                            }
                          },
                          onFieldSubmitted: (val) {
                            setState(() {
                              applicantCity = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.map_rounded),
                            hintText: 'Country',
                          ),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter valid country';
                            }
                          },
                          onFieldSubmitted: (val) {
                            setState(() {
                              applicantCountry = val;
                            });
                          },
                        ),
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
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(160, 55),
                            primary: Color.fromRGBO(4, 88, 125,1),
                            backgroundColor: Color.fromRGBO(4, 88, 125,1),
                          ),
                        ),
                      ],
                    ),

              ),
            ),
          )
      ),

    );
  }
}
