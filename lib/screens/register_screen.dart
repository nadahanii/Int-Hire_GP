import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_feature/screens/applicant_register_screen.dart';
import 'package:history_feature/screens/recruiter_register_screen.dart';
import '../helpers/pair.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/Register_Screen';
  //final ThemeData registerTheme;
  RegisterScreen({
    Key? key,
    /* required this.registerTheme*/
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var streetController = TextEditingController();
  var countryController = TextEditingController();
  var cityController = TextEditingController();

  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool isDateSelected = false;
  TextEditingController _birthdayController = TextEditingController();
  //DateTime selectedDate = DateTime.now();
  String birthDateInString ="";
  DateTime birthDate=DateTime.now();

  int _role = 1;
  final List<Pair<String, int>> _roleList = const [
    Pair('Applicant', 0),
    Pair('Recruiter', 1),
  ];
  int _gender = 1;
  final List<Pair<String, int>> _genderList = const [
    Pair('female', 0),
    Pair('male', 1),
  ];
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
  Widget _radioButtonGroup({required String text, required List<Widget> list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: Color.fromRGBO(4, 88, 125, 1)),
        ),
        ...list,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
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
                      Text('Register',
                          style: GoogleFonts.sourceCodePro(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Color.fromRGBO(4, 88, 125, 4))),
                      SizedBox(
                        height: 40.0,
                      ),

                      TextFormField(
                        controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                              return "Enter correct name";
                            else
                              return null;
                          }), //name
                      SizedBox(
                        height: 15.0,
                      ),


                      TextFormField(
                        controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone number',
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^(01)[0-9]{9}$').hasMatch(value))
                              return "Enter correct phone";
                            else
                              return null;
                          }), //phone
                      SizedBox(
                        height: 15.0,
                      ),

                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          //Validator
                        },
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                      ), //mail
                      SizedBox(
                        height: 15.0,
                      ),

                      TextFormField(
                        controller: passwordController,
                        obscureText: _isObscure1,
                        decoration: InputDecoration(
                          labelText: 'Password (at least 8)',
                          hintText:
                              "1Upper 1Lower 1Dig 1Spec",
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure1 = !_isObscure1;
                                });
                              }),
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (password) {
                          //Validator
                        },
                        validator: (password) {
                          if (password!.isEmpty ||
                              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(password)) {
                            return 'Enter a valid Password (8 from \'\'uppercase and lowercase letters, special chars and numbers\'\')';
                          }
                          return null;
                        },
                      ), //pass
                      SizedBox(
                        height: 15.0,
                      ),

                      TextFormField(
                        obscureText: _isObscure2,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure2 = !_isObscure2;
                                });
                              }),
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value) {
                          //Validator
                        },
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(value)) {
                            return 'Enter a valid Password (8 from \'\'uppercase and lowercase letters, special chars and numbers\'\')';
                          }
                          if (passwordController.text != value)
                            return 'Password does not match';
                          return null;
                        },
                      ), //confirm
                      SizedBox(
                        height: 15.0,
                      ),

                      TextFormField(
                        controller: streetController,
                          decoration: InputDecoration(
                            labelText: 'Street name',
                            prefixIcon: Icon(
                              Icons.streetview,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                              return "Enter correct Street name";
                            else
                              return null;
                          }), //street
                      SizedBox(
                        height: 15.0,
                      ),

                      TextFormField(
                          controller: cityController,
                          decoration: InputDecoration(
                            labelText: 'City name',
                            prefixIcon: Icon(
                              Icons.location_city,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                              return "Enter correct city name";
                            else
                              return null;
                          }), //city
                      SizedBox(
                        height: 15.0,
                      ),


                      TextFormField(
                        controller: countryController,
                          decoration: InputDecoration(
                            labelText: 'Country name',
                            prefixIcon: Icon(
                              Icons.map_rounded,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                              return "Enter correct country name";
                            else
                              return null;
                          }), //country
                      SizedBox(
                        height: 15.0,
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
                           prefixIcon: Icon(
                            Icons.date_range,
                          ),

                       //   border: OutlineInputBorder(),
                        ),
                      ),  //birthday
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
                      SizedBox(height: 15.0),
                      _radioButtonGroup(
                        text: 'Role',
                        list: _roleList.map((pair) {
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

                      SizedBox(height: 15.0),
                      TextButton.icon(
                        onPressed: (() {
                          if (_form.currentState!.validate()) {
                            if (_role == 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ApplicantRegisterScreen()));
                              //Navigator.of(context).pushReplacementNamed('/applicant_register_screen');
                            } else if (_role == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RecruiterRegisterScreen()));
                              // Navigator.of(context).pushReplacementNamed('/recruiter_register_screen');
                            }
                          }
                        }),
                        icon: const Icon(
                          Icons.app_registration,
                          size: 28,
                        ),
                        label: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 35,
                          child: const Text(
                            'Register',
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
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'have an account?',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/Login_Screen');
                            },
                            child: Text(
                              'Login Now',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                      /*  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'have an account?',
                            style: widget.registerTheme.textTheme.labelMedium,
                          ),
                         TextButton.icon(
                            onPressed: (() {

                                Navigator.of(context).pushReplacementNamed('/Login_Screen');

                            }),
                            icon: const Icon(
                              Icons.login_outlined,
                              size: 28,
                            ),
                            label: Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 35,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(4, 88, 125,1),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),

                        ],
                      ),*/
                    ],
                  ),
                ))));
  }
}
