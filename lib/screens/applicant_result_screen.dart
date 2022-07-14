import 'package:flutter/material.dart';
import 'package:history_feature/models/PersonalityDataClass.dart';

import 'job_view.dart';

class ApplicantResult extends StatefulWidget {
  static String routeName = '/applicant_result';
  final String personality_type;
  final PersonalityData personalityData;
  const ApplicantResult({
    Key? key,
    required this.personality_type,
    required this.personalityData,
  }) : super(key: key);
  @override
  State<ApplicantResult> createState() =>
      _ApplicantResultState(personality_type, personalityData);
}

class _ApplicantResultState extends State<ApplicantResult> {
  late String _personality_type;
  late PersonalityData _personalityData;
  _ApplicantResultState(this._personality_type, this._personalityData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text(_personality_type),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 15),
          child: Column(
            children: [
              Image.asset(
                'assets/' + _personality_type + '.png',
                width: 400.0,
                height: 350.0,
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Nickname',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_personalityData.getNickname(),
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Definition',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_personalityData.getDefinition(),
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Introduction',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_personalityData.getIntroduction(),
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Strengths & Weaknesses',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_personalityData.getStrenAndWeak(),
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Career Paths',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_personalityData.getCareerPaths(),
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Workplace Habit',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_personalityData.getWorkplaceHabit(),
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Conclusion',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_personalityData.getDescription(),
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ),
              ),
              TextButton.icon(
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobView(history: false)));
                }),
                icon: const Icon(
                  Icons.home,
                  size: 28,
                ),
                label: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 35,
                  child: const Text(
                    'Home',
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
    );
  }
}
