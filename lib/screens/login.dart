import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:history_feature/screens/register.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final Color facebookColor = const Color(0xff39579A);
  final Color googleColor = const Color(0xffDF4A32);

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
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                     // print(value);
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
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () {
                        //if (formKey.currentState!.validate()) {
                        Provider.of<Auth>(context, listen: false).login(
                          json.encode(
                              {
                                'email': emailController.text,
                                'password': passwordController.text,
                              } )   ,

                        );
                        //}
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot your Password?',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        socialButtonRect(
                            'Login with Facebook ', facebookColor, Icons.facebook),
                        socialButtonRect('Login with Google ', googleColor, Icons.android),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/register');
                        },
                        child: Text(
                          'Register Now',
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