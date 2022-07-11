import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {

  static const routeName = '/splash_screen';
  final ThemeData SplashTheme;
  SplashScreen({Key? key, required this.SplashTheme}) : super(key: key);

@override
State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255,198,196,1),
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('logo.png',
                          width: 500.0,
                          height: 420.0,
                          //fit: BoxFit.cover
                      ),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 10.0)),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0)),
                      TextButton.icon(
                      //  padding: const EdgeInsets.symmetric(vertical: 10.0),
                        onPressed: (() {

                            Navigator.pushNamed(context, '/Login_Screen');

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
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(4, 88, 125,1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),   //Login
                      SizedBox(
                        height: 15.0,
                      ),

                      TextButton.icon(
                        onPressed: (() {


                          Navigator.pushNamed(context, '/Register_Screen');
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
                      ),    //Register


                    ],
                  ),
                )
            )
        )






    );
  }
}
