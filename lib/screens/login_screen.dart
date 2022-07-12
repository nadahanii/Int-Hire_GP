import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../helpers/components.dart';
import '../providers/auth.dart';

class LoginScreen extends StatefulWidget {
  final ThemeData loginTheme;
  LoginScreen({Key? key, required this.loginTheme}) : super(key: key);
  static const routeName = '/Login_Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const routeName = '/login';
  final Color facebookColor = const Color(0xff39579A);
  final Color googleColor = const Color(0xffDF4A32);
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool _isObscure = true;
  Widget socialButtonRect(title, color, icon, {Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 30,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.loginTheme.backgroundColor,
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
                    Text('LOGIN',
                        style: GoogleFonts.sourceCodePro(
                            fontSize: 35,
                            fontWeight: FontWeight.w800,
                            color: Color.fromRGBO(4, 88, 125, 4))),
                    SizedBox(
                      height: 30.0,
                    ),

                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),

                      //style: widget.loginTheme.textTheme.labelMedium,
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
                      height: 10.0,
                    ),

                    TextFormField(
                      controller: passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                      ),
                      //style: widget.loginTheme.textTheme.labelMedium,
                      keyboardType: TextInputType.visiblePassword,
                      onFieldSubmitted: (password) {
                        //Validator
                      },
                      validator: (password) {
                        if (password!.isEmpty ||
                            !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(password)) {
                          return 'Enter a valid Password!';
                        }
                        return null;
                      },
                    ), //pass

                    SizedBox(
                      height: 10.0,
                    ),

                    TextButton.icon(
                      onPressed: (() {
                        if (_form.currentState!.validate()) {
                          Provider.of<Auth>(context, listen: false)
                              .login(json.encode({
                            "email": emailController.text,
                            "password": passwordController.text,
                          })).then((value) {
                            if (value != 'login successfully') {
                              showToast(text: value, state: ToastStates.ERROR);
                            }else{
                              showToast(text: value, state: ToastStates.SUCCESS);
                            }
                          });
                        }
                      }),
                      icon: const Icon(
                        Icons.login,
                        size: 28,
                      ),
                      label: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 35,
                        child: const Text(
                          'Login',
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
                      height: 5.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/ForgetPassword_Screen');
                      },
                      child: Text(
                        'Forgot My Password',
                        style: widget.loginTheme.textTheme.labelMedium,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          socialButtonRect('Facebook',
                              Color.fromRGBO(4, 88, 125, 1), Icons.facebook),
                          SizedBox(height: 10.0),
                          socialButtonRect('Google',
                              Color.fromRGBO(4, 88, 125, 1), Icons.android),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: widget.loginTheme.textTheme.labelMedium,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/Register_Screen');
                          },
                          child: Text(
                            'Register Now',
                            style: widget.loginTheme.textTheme.bodyText2,
                          ),
                        ),
                        /*  TextButton.icon(
                            onPressed: (() {
                              Navigator.of(context).pushReplacementNamed('/Register_Screen');
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
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(4, 88, 125,1),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),*/
                        /* TextButton.icon(
                            onPressed: (() {
                              Navigator.pushNamed(context, '/ForgetPassword_Screen');

                            }),
                            icon: const Icon(
                              Icons.password_sharp,
                              size: 28,
                            ),
                            label: Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 40,
                              child: const Text(
                                'I forgot my password',
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
                          ),*/
                      ],
                    ),
                  ]))),
        ));
  }
}
