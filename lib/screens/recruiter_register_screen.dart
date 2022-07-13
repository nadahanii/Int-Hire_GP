import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecruiterRegisterScreen extends StatefulWidget {
  static const routeName = '/recruiter_register_screen';
  const RecruiterRegisterScreen({Key? key}) : super(key: key);

  @override
  State<RecruiterRegisterScreen> createState() =>
      RecruiterRegisterScreenState();
}

class RecruiterRegisterScreenState extends State<RecruiterRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late String companyName, companyLocation, companyDescription;
  var streetController = TextEditingController();
  var countryController = TextEditingController();
  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 70, right: 25, left: 25, bottom: 25),
                child: Stack(children: [
                  Column(children: <Widget>[
                    Text('Recruiter Registeration',
                        style: GoogleFonts.sourceCodePro(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color.fromRGBO(4, 88, 125, 4))),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.location_city_outlined),
                          hintText: 'Company Name ',
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                            return "Enter correct name of company";
                          else
                            return null;
                        },
                        onFieldSubmitted: (val) {
                          setState(() {
                            companyLocation = val;
                          });
                        }), //Company name
                    SizedBox(
                      height: 25,
                    ),

                    TextFormField(
                        controller: streetController,
                        decoration: InputDecoration(
                          labelText: 'Company Street name',
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
                          labelText: 'Company City name',
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
                          labelText: 'Company Country name',
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
                    SizedBox(
                      height: 25,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.description_outlined),
                        hintText: 'Company Description/Field ',
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                          return "Enter correct description";
                        else
                          return null;
                      },
                      onFieldSubmitted: (val) {
                        setState(() {
                          companyDescription = val;
                        });
                      },
                    ), //description
                    SizedBox(
                      height: 25,
                    ),

                    TextButton.icon(
                      onPressed: (() {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context)
                              .pushReplacementNamed('/history');
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
                  ]),
                ]),
              ),
            ),
          ),
        ));
  }
}
