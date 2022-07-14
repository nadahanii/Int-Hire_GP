import 'package:flutter/material.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/edit_password_Screen';

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool _isObscure3 = true;
  var oldpasswordController = TextEditingController();
  var newpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            'Edit Password',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
          child: Form(
            key: _form,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: oldpasswordController,
                    obscureText: _isObscure1,
                    decoration: InputDecoration(
                      labelText: 'Old Password',
                      // hintText:
                      // "1Upper 1Lower 1Dig 1Spec",
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
                      if (password!.isEmpty) {
                        return 'Enter a valid Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: newpasswordController,
                    obscureText: _isObscure3,
                    decoration: InputDecoration(
                      labelText: 'new Password',
                      // hintText:
                      // "1Upper 1Lower 1Dig 1Spec",
                      suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure3
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure3 = !_isObscure1;
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
                  ),
                  SizedBox(
                    height: 25,
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
                      if (newpasswordController.text != value)
                        return 'Password does not match';
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton.icon(
                    onPressed: (() {
                      if (_form.currentState!.validate()) {
                        Navigator.of(context)
                            .pushReplacementNamed('/Login_Screen');
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
                        'Submit',
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
                ],
              ),
            ),
          ),
        ));
  }
}
