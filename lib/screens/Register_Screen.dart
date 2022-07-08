import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/models/job.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../helpers/pair.dart';
import '../providers/auth.dart';
import 'home_screen.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/Register_Screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();




  int _rule = 1;
  final List<Pair<String, int>> _ruleList = const [
    Pair('Applicant', 0),
    Pair('Recruiter', 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'name',
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'phone number',
                    prefixIcon: Icon(
                      Icons.phone,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15.0),
                TextFormField(
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val){
                    if(val != passwordController.text)
                      return 'Not Match';
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                    height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'have an account?',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                      child: Text(
                        'Login Now',
                      ),
                    ),
                  ],
                ),
                  ],
                ),
    )
    )
    )
    );
  }


}