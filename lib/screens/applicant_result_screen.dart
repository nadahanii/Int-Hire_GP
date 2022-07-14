import 'package:flutter/material.dart';

class ApplicantResult extends StatefulWidget {
  static String routeName = '/applicant_result';
  final String personality_type;
  const ApplicantResult({Key? key, required this.personality_type})
      : super(key: key);
  @override
  State<ApplicantResult> createState() =>
      _ApplicantResultState(personality_type);
}

class _ApplicantResultState extends State<ApplicantResult> {
  late String personality_type;
  _ApplicantResultState(this.personality_type);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(personality_type),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [Image.asset('assets/' + personality_type.toLowerCase() + '.png'),Text("data")],
          ),
        ),
      ),
    );
  }
}
