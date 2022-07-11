import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_feature/screens/profile_screen.dart';
import 'package:history_feature/screens/HistoryHomePage.dart';

class recruiter_register_screen extends StatefulWidget {
  final ThemeData registerTheme;
  static const routeName = '/recruiter_register_screen';
  const recruiter_register_screen({Key? key,required this.registerTheme}) : super(key: key);

  @override
  State<recruiter_register_screen> createState() =>
      _recruiter_register_screenState();
}

class _recruiter_register_screenState extends State<recruiter_register_screen> {
  final _formKey = GlobalKey<FormState>();
  late String companyName, companyLocation, companyDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.registerTheme.backgroundColor,
      body: Center(
          child: Form(
        key: _formKey,
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70, right: 25, left: 25, bottom: 25),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Text(
                    'Recruiter Registeration',
                      style: GoogleFonts.sourceCodePro(fontSize: 20 , fontWeight: FontWeight.w800, color: Color.fromRGBO(4, 88, 125,4))
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_city_outlined),
                      hintText: 'Company Name ',
                    ),
                    keyboardType: TextInputType.name,
                      validator: (value)
                      {
                        if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                          return "Enter correct name of company";
                        else
                          return null;
                      },
                     onFieldSubmitted: (val) {
                     setState(() {
                     companyLocation = val;
                          });
                  }),   //Company name
                  SizedBox(
                    height: 25,
                  ),


                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_on),
                      hintText: 'Company Address (253 Cherry St. giza)',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^\d{1,5}\s(\b\w*\b\s){1,2}\w*\.\s\w*$').hasMatch(value)) //This allows 1-5 digits for the house number, a space, a character followed by a period (for N. or S.), 1-2 words for the street name, finished with an abbreviation (like st. or rd.).
                        return "Enter correct Address (num streetname st. giza)";
                      else
                        return null;
                    },
                    onFieldSubmitted: (val) {
                      setState(() {
                        companyLocation = val;
                      });
                    },
                  ),   //address
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
                      if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                        return "Enter correct description";
                      else
                        return null;
                    },
                    onFieldSubmitted: (val) {
                      setState(() {
                        companyDescription = val;
                      });
                    },
                  ),  //description
                  SizedBox(
                    height: 25,
                  ),

              TextButton.icon(
                onPressed: (() {

                  if(_formKey.currentState!.validate())
                  {
                    Navigator.of(context).pushReplacementNamed('/history');
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
                    color: Color.fromRGBO(4, 88, 125,1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
        ]
        ),
            ]
        ),
      ),
      ),
    ),
      )
    );
  }
}
