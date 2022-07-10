import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(top: 70, right: 25, left: 25, bottom: 25),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Text(
                    'Recruiter Register',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid company name';
                      }
                    },
                    onFieldSubmitted: (val) {
                      setState(() {
                        companyName = val;
                        //print(companyName);
                      });
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_on),
                      hintText: 'Company Address (block no. , street , city)',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid company address';
                      }
                    },
                    onFieldSubmitted: (val) {
                      setState(() {
                        companyLocation = val;
                      });
                    },
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
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid company description';
                      }
                    },
                    onFieldSubmitted: (val) {
                      setState(() {
                        companyDescription = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(160, 55),
                    primary: Colors.indigo,
                    backgroundColor: Colors.indigo,
                  ),
                ),
              )
            ],
          ),
        ),
      )
      ),
    );
  }
}
