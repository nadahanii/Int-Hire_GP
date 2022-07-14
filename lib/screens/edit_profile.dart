import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:provider/provider.dart';
import '../helpers/components.dart';
import '../helpers/pair.dart';
import '../models/job.dart';
import 'package:intl/intl.dart';

import '../providers/auth.dart';
import 'navbar_screen.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
  static const routeName = '/edit_Screen';
  final ApplicantUser? user;
  EditProfilePage({Key? key, required this.user}) : super(key: key);
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  Education _education = Education.Bachelors;
  MilitaryStatus _militaryStatus = MilitaryStatus.Postponed;
  int _gender = 1;

  final List<Pair<String, Education>> _educationList = const [
    Pair('High School', Education.High_School),
    Pair('Bachelor\'s Degree', Education.Bachelors),
    Pair('Master\'s Degree', Education.Masters),
    Pair('Doctorate\'s Degree', Education.Doctorate),
    Pair('Luxurious Degree', Education.Luxurious),
  ];
  final List<Pair<String, int>> _genderList = const [
    Pair('female', 0),
    Pair('male', 1),
  ];
  final List<Pair<String, MilitaryStatus>> _militaryStatusList = const [
    Pair('Not Applicable', MilitaryStatus.NotApplicable),
    Pair('Completed', MilitaryStatus.Completed),
    Pair('Exempted', MilitaryStatus.Exempted),
    Pair('Postponed', MilitaryStatus.Postponed),
  ];

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _twitternameController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
  final _tagsController = TextEditingController();
  final _genderController = TextEditingController();
  final _skillsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _education = widget.user!.educationLevel;
      _tagsController.text = widget.user!.tags.join(",");
      _nameController.text = widget.user!.name;
      _phoneController.text = widget.user!.phoneNumber;
      _passwordController.text = widget.user!.password;
      _cityController.text = widget.user!.city;
      _streetController.text = widget.user!.street;
      _countryController.text = widget.user!.country;
      _birthdayController.text = widget.user!.birthDay;
      _militaryStatus = widget.user!.militaryStatus;
      _twitternameController.text = widget.user!.twitterUsername;
      _emailController.text = widget.user!.email;
      _skillsController.text = widget.user!.skills;
      if (widget.user!.isMale) {
        _gender = 1;
        _genderController.text = 'Male';
      }

      if (!widget.user!.isMale) {
        _genderController.text = "Female";
        _gender = 0;
      }
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _birthdayController.text =
            DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    });
  }

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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 24),
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                        return "Enter correct name";
                      else
                        return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ), //name
                  const SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(01)[0-9]{9}$').hasMatch(value))
                          return "Enter correct phone";
                        else
                          return null;
                      }), //phone
                  const SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ), //email
                  const SizedBox(
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
                      labelText: 'Birthday',
                      border: OutlineInputBorder(),
                    ),
                  ), //birthday
                  const SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                    controller: _streetController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                        return "Enter correct Street name";
                      else
                        return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Street',
                      border: OutlineInputBorder(),
                    ),
                  ), //street
                  const SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                        return "Enter correct city name";
                      else
                        return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                  ), //city
                  const SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                    controller: _countryController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                        return "Enter correct country name";
                      else
                        return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Country',
                      border: OutlineInputBorder(),
                    ),
                  ), //country
                  const SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                    controller: _twitternameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Twitter Username',
                      border: OutlineInputBorder(),
                    ),
                  ), //twitter
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _tagsController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'tags',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      controller: _skillsController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Skills',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Enter correct phone";
                        else
                          return null;
                      }), //Skills
                  const SizedBox(
                    height: 20.0,
                  ),
                  _radioButtonGroup(
                    text: 'Education Level',
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
                  const SizedBox(
                    height: 5.0,
                  ),

                  _radioButtonGroup(
                    text: 'Military Status',
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
                  const SizedBox(
                    height: 5.0,
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
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/edit_password_Screen');
                    },
                    child: Text(
                      'Change Password',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_gender == 1) {
                        widget.user!.isMale = true;
                      } else {
                        widget.user!.isMale = false;
                      }
                      widget.user!.email = _emailController.text;
                      widget.user!.birthDay = _birthdayController.text;
                      widget.user!.twitterUsername =
                          _twitternameController.text;
                      widget.user!.educationLevel = _education;
                      widget.user!.name = _nameController.text;
                      widget.user!.password = _passwordController.text;
                      widget.user!.street = _streetController.text;
                      widget.user!.city = _cityController.text;
                      widget.user!.country = _countryController.text;
                      widget.user!.city = _cityController.text;
                      widget.user!.phoneNumber = _phoneController.text;
                      widget.user!.militaryStatus = _militaryStatus;
                      widget.user!.tags = _tagsController.text.split(',');
                      widget.user!.skills = _skillsController.text;

                      Provider.of<Auth>(context, listen: false)
                          .updateApplicant(json.encode({
                        "name": widget.user?.name,
                        "email": widget.user?.email,
                        "phoneNumber": widget.user?.phoneNumber,
                        "password": widget.user?.password,
                        "street": widget.user?.street,
                        "city": widget.user?.city,
                        "country": widget.user?.country,
                        "birthDay": widget.user?.birthDay,
                        "gender": widget.user?.isMale == true ? 1 : 0,
                        "militaryStatus": _militaryStatus.index,
                        "twitterUsername": _twitternameController.text,
                        "educationLevel": _education.index,
                        "tags": _tagsController.text.split(','),
                        "skills": _skillsController.text
                      }))
                          .then((value) {
                        if (value != 'update successfully') {
                          showToast(text: value, state: ToastStates.ERROR);
                        } else {
                          showToast(text: value, state: ToastStates.SUCCESS);
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  NavbarScreen(selected: 3,)));
                        }
                      });
                    },
                    child: Text(
                      'Save New Changes',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
