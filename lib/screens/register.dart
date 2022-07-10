import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/models/job.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../helpers/pair.dart';
import '../providers/auth.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();

  var nameController = TextEditingController();

  var phoneNumberController = TextEditingController();

  var streetController = TextEditingController();

  var countryController = TextEditingController();

  var cityController = TextEditingController();

  var twitterUsernameController = TextEditingController();

  var passwordController = TextEditingController();

  final _birthdayController = TextEditingController();

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

  int _gender = 1;

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

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365 * 100,)),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _birthdayController.text = DateFormat.yMd().format(pickedDate);
      });
    });
  }

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
                  SizedBox(
                    height: 10.0,
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
                    controller: twitterUsernameController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'twitter username',
                      prefixIcon: FaIcon(FontAwesomeIcons.twitter),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      TextFormField(
                        controller: countryController,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          constraints: BoxConstraints(
                            maxWidth: (MediaQuery.of(context).size.width-40.0) * 0.3,
                          ),
                          labelText: 'country',
                          prefixIcon: Icon(
                            Icons.location_city,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width-40.0) * 0.05,
                      ),
                      TextFormField(
                        controller: cityController,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          constraints: BoxConstraints(
                            maxWidth: (MediaQuery.of(context).size.width-40.0) * 0.3,
                          ),
                          labelText: 'city',
                          prefixIcon: Icon(
                            Icons.location_city_outlined,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width-40.0) * 0.05,
                      ),
                      TextFormField(
                        controller: streetController,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          constraints: BoxConstraints(
                            maxWidth: (MediaQuery.of(context).size.width-40.0) * 0.3,
                          ),
                          labelText: 'street',
                          prefixIcon: Icon(
                            Icons.home_outlined,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _birthdayController,
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a valid birthday';
                      }
                      return null;
                    },
                    onTap: _presentDatePicker,
                    decoration: const InputDecoration(
                      labelText: 'birthday',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
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
                    height: 20.0,
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
                    height: 20.0,
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
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () {
                        //if (formKey.currentState!.validate()) {
                          Provider.of<Auth>(context, listen: false).signup(
                              json.encode(
                              {
                              'name': nameController.text,
                              'email': emailController.text,
                              'phoneNumber': phoneNumberController.text,
                              'password': passwordController.text,
                              'street': streetController.text,
                              'city': cityController.text,
                              'country': countryController.text,
                              'birthDay': _birthdayController.text,
                              'gender': _gender,
                              'militaryStatus': _militaryStatus.index,
                              'twitterUsername': twitterUsernameController.text,
                              'educationLevel': _education.index
                              } )   ,

                          );
                        //}
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
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
            ),
          ),
        ),
    );
  }
}
