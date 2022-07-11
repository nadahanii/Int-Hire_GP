import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_feature/screens/applicant_register_screen.dart';
import 'package:history_feature/screens/recruiter_register_screen.dart';
import '../helpers/pair.dart';

class ForgotPassword extends StatefulWidget {
  //const ForgotPassword({Key? key}) : super(key: key);
  static const routeName = '/ForgetPassword_Screen';
  final ThemeData registerTheme;
  ForgotPassword({Key? key , required this.registerTheme}) : super(key: key);


  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.registerTheme.backgroundColor,
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
                          'Enter your email to send an reset link',
                          style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(4, 88, 125,4))
                      ),
                      SizedBox(
                        height: 40.0,
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
                      ),   //mail
                      SizedBox(
                        height: 15.0,
                      ),

                      TextButton.icon(
                        onPressed: (() {
                          if(_form.currentState!.validate())
                            {
                              Navigator.pushNamed(context, '/Login_Screen');
                            }
                        }),
                        icon: const Icon(
                          Icons.read_more,
                          size: 28,
                        ),
                        label: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 35,
                          child: const Text(
                            'Send Reset Link',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontSize: 15

                            ),

                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(4, 88, 125,1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),   //send link
                      SizedBox(
                        height: 15.0,
                      ),

                      TextButton.icon(
                        onPressed: (() {

                            Navigator.pushNamed(context, '/Login_Screen');


                        }),
                        icon: const Icon(
                          Icons.home,
                          size: 28,
                        ),
                        label: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 35,
                          child: const Text(
                            'Return Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontSize: 15

                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(4, 88, 125,1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),    //back to login


                    ],
                  ),
                )
            )
        )
    );



  }
  }