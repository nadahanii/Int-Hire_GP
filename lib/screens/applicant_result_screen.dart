import 'package:flutter/material.dart';
import 'package:history_feature/models/PersonalityDataClass.dart';

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
                'assets/' + 'infj' + '.png',
                width: 400.0,
                height: 350.0,
              ),
              Card(
                child: ListTile(
                  title: Text(_personalityData.getNickname()),
                  subtitle: Text('Here is a second line'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
