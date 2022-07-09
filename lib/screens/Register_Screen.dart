import 'package:flutter/material.dart';
import 'package:history_feature/screens/applicant_register_screen.dart';
import 'package:history_feature/screens/recruiter_register_screen.dart';
import '../helpers/pair.dart';

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
            child: Center(
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
                  SizedBox(height: 15.0),
                  TextFormField(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (val) {
                      if (val != passwordController.text) return 'Not Match';
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
                  SizedBox(height: 15.0),
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
                  OutlinedButton(
                    onPressed: () {
                      if (_role == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    applicant_register_screen()));
                        //Navigator.of(context).pushReplacementNamed('/applicant_register_screen');
                      } else if (_role == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    recruiter_register_screen()));
                        // Navigator.of(context).pushReplacementNamed('/recruiter_register_screen');
                      }
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(160, 55),
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
            ))));
  }
}
