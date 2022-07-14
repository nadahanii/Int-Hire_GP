import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';
import '../helpers/pair.dart';
import '../models/job.dart';
import 'package:intl/intl.dart';
import 'package:history_feature/screens/profile_screen_recruiter.dart';
import 'package:history_feature/models/recruiter_user.dart';


class EditProfileRecPage extends StatefulWidget {
  @override

  static const routeName = '/edit_Screen';
  final RecruiterUser? user;
  //final user = UserPreferences.myUser;
  EditProfileRecPage({Key? key, this.user}) : super(key: key);
  _EditProfileRecPageState createState() => _EditProfileRecPageState();
}
class _EditProfileRecPageState extends State<EditProfileRecPage> {
  int _gender =1;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _companyStreetController = TextEditingController();
  final _companyCityController = TextEditingController();
  final _companyCountryController = TextEditingController();
  final _companyDescriptionController = TextEditingController();
  final _companyIDController = TextEditingController();
  final _positionController = TextEditingController();
  final _companyNameController = TextEditingController();

  final List<Pair<String, int>> _genderList = const [
    Pair('female', 0),
    Pair('male', 1),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user!.name!;
      _phoneController.text = widget.user!.phoneNumber!;
      _emailController.text = widget.user!.email!;
      _cityController.text = widget.user!.city!;
      _streetController.text = widget.user!.street!;
      _countryController.text = widget.user!.country!;
      _birthdayController.text = widget.user!.birthDay!;
      _positionController.text = widget.user!.position!;
      _companyNameController.text = widget.user!.company!.name!;

      if (widget.user!.isMale!) {
        _gender = 1;
        _genderController.text = 'Male';
      }

      if (!widget.user!.isMale!) {
        _genderController.text = "Female";
        _gender = 0;
      }
      _companyIDController.text = widget.user!.company!.id.toString();
      _companyCityController.text = widget.user!.company!.city!;
      _companyCountryController.text = widget.user!.company!.country!;
      _companyStreetController.text = widget.user!.company!.street!;
      _companyDescriptionController.text = widget.user!.company!.description!;
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
              DateFormat('dd-MM-yyyy hh:mm a').format(pickedDate);
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
                  ),  //name
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
                      }
                  ),  //phone
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
                  ),  //street
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
                  ),  //city
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
                  ),  //country
                  const SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                    controller: _positionController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Position',
                      border: OutlineInputBorder(),
                    ),
                  ),  //twitter
                  const SizedBox(
                    height: 20.0,
                  ),
                  _radioButtonGroup(
                    text: 'Gender',
                    list: _genderList.map((pair) {
                      return ListTile(
                        title: Text(pair.item1),
                        leading: Radio<int>
                          (
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
                  TextFormField(
                    controller: _companyNameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                        return "Enter correct company name";
                      else
                        return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Company name',
                      border: OutlineInputBorder(),
                    ),
                  ),  //company name
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _companyStreetController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                        return "Enter correct Street name";
                      else
                        return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Company Street name',
                      border: OutlineInputBorder(),
                    ),
                  ),  //company street
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _companyCityController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                        return "Enter correct company city name";
                      else
                        return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Company City name',
                      border: OutlineInputBorder(),
                    ),
                  ),  //company city
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _companyCountryController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                        return "Enter correct company country name";
                      else
                        return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Company Country name',
                      border: OutlineInputBorder(),
                    ),
                  ),  //company country
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _companyDescriptionController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Enter correct company country name";
                      else
                        return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Company Description',
                      border: OutlineInputBorder(),
                    ),
                  ),  //company description
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/edit_password_Screen');
                    },
                    child:
                    Text(
                      'Change Password',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        if (_gender == 1) {
                          widget.user!.isMale = true;
                        }
                        else {
                          widget.user!.isMale = false;
                        }
                        widget.user!.email = _emailController.text;
                        widget.user!.birthDay = _birthdayController.text;
                        widget.user!.name = _nameController.text;
                        widget.user!.password = _passwordController.text;
                        widget.user!.street = _streetController.text;
                        widget.user!.city = _cityController.text;
                        widget.user!.country = _countryController.text;
                        widget.user!.city = _cityController.text;
                        widget.user!.phoneNumber = _phoneController.text;
                        widget.user!.position = _positionController.text;
                        widget.user!.company!.name =
                            _companyNameController.text;
                        widget.user!.company!.street =
                            _companyStreetController.text;
                        widget.user!.company!.city =
                            _companyCityController.text;
                        widget.user!.company!.country =
                            _companyCountryController.text;
                        widget.user!.company!.description =
                            _companyDescriptionController.text;
                        Navigator.of(context).pushNamed(
                            '/profileRec_Screen', arguments: widget.user);
                      }
                    },
                    child:
                    Text(
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