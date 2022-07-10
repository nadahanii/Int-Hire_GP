import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/models/job.dart';
import 'package:history_feature/screens/applicant_register_screen.dart';
import 'package:history_feature/screens/recruiter_register_screen.dart';
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
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  bool _isObscure = true;

  int _role = 1;
  final List<Pair<String, int>> _roleList = const [
    Pair('Applicant', 0),
    Pair('Recruiter', 1),
  ];
  int _gender=1;
  final List<Pair<String, int>> _genderList = const [
    Pair('female', 0),
    Pair('male', 1),
  ];

  Widget _radioButtonGroup({required String text, required List<Widget> list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        ...list,
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
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
                          decoration: InputDecoration(
                            labelText: 'name',
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                          validator: (value)
                          {
                            if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                              return "Enter correct name";
                            else
                              return null;
                          }
                      ),  //name
                      SizedBox(
                        height: 15.0,
                      ),


                      TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'phone number',
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                          ),
                          validator: (value)
                          {
                            if (value!.isEmpty || !RegExp(r'^(01)[0-9]{9}$').hasMatch(value))
                              return "Enter correct phone";
                            else
                              return null;
                          }
                      ), //phone
                      /*controller: nameController,
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
                ),*/
                      SizedBox(
                        height: 15.0,
                      ),


                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email Address',
                          prefixIcon: Icon (
                            Icons.email,
                          ),

                        ),
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          //Validator
                        },
                        validator: (value) {
                          if ( value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                      ),   //email
                      /*  TextFormField(
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
                ),*/
                      SizedBox(
                        height: 15.0,
                      ),


                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(labelText: 'Password',
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                })
                                ; }
                          ),
                          prefixIcon: Icon (
                            Icons.lock,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (password) {
                          //Validator
                        },
                        validator: (password) {
                          if ( password!.isEmpty ||
                              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(password)) {
                            return 'Enter a valid Password!'
                            ;
                          }
                          return null;
                        },
                      ),   //password
                      /*  TextFormField(
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
                ),*/
                      SizedBox(
                        height: 15.0,
                      ),



                      TextFormField(
                        decoration: InputDecoration(labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                })
                                ; }
                          ),
                          prefixIcon: Icon (
                            Icons.lock,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value) {
                          //Validator
                        },
                        validator: (value) {
                          if ( value!.isEmpty ||
                              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(value) ) {
                            return 'Enter a valid Password!'
                            ;
                          }
                          if (passwordController.text != value)
                            return 'Password doesnot match';
                          return null;
                        },
                      ),   //ConfirmPassword
                      /*  TextFormField(
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
                ),*/
                      SizedBox(
                        height: 15.0,
                      ),


                      _radioButtonGroup(
                        text: 'Gender',
                        list: _genderList.map((pair) {
                          return ListTile(
                            title: Text(pair.item1),
                            leading: Radio<int>(
                              value: pair.item2,
                              groupValue: _gender,
                              onChanged: (int? value) {
                                setState(() {
                                  _gender = value!;
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                          height: 15.0),
                      _radioButtonGroup(
                        text: 'Role',
                        list: _roleList.map((pair){
                          return ListTile(
                            title: Text(pair.item1),
                            leading: Radio<int>(
                              value: pair.item2,
                              groupValue: _role,
                              onChanged: (int? value) {
                                setState(() {
                                  _role = value!;
                                });

                              },
                            ),
                          );

                        }).toList(),
                      ),

                      SizedBox(
                          height: 15.0),
                      OutlinedButton(
                        onPressed: (){
                          if(_form.currentState!.validate())
                          {
                            if(_role==0)
                            {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => applicant_register_screen())
                              );
                              //Navigator.of(context).pushReplacementNamed('/applicant_register_screen');
                            }
                            else if(_role==1)
                            {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => recruiter_register_screen())
                              );
                              // Navigator.of(context).pushReplacementNamed('/recruiter_register_screen');
                            }
                          }

                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),

                        style: OutlinedButton.styleFrom(
                          fixedSize: Size(160,55),
                          primary: Colors.indigo,
                          backgroundColor: Colors.indigo,
                        ),
                      ),
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