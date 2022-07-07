import 'package:flutter/material.dart';

class applicant_register_screen extends StatefulWidget {
  static const routeName = '/applicant_register_screen';
  const applicant_register_screen({Key? key}) : super(key: key);

  @override
  State<applicant_register_screen> createState() => _applicant_register_screenState();
}

class _applicant_register_screenState extends State<applicant_register_screen> {
  var twitterUsernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('applicant'),
      ),
    );
  }
}
