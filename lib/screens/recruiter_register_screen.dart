import 'package:flutter/material.dart';

class recruiter_register_screen extends StatefulWidget {
  static const routeName = '/recruiter_register_screen';
  const recruiter_register_screen({Key? key}) : super(key: key);

  @override
  State<recruiter_register_screen> createState() => _recruiter_register_screenState();
}

class _recruiter_register_screenState extends State<recruiter_register_screen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('recruiter'),
      ),
    );
  }
}
