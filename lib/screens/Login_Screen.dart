import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Color.fromRGBO(255, 198, 196,2),
      //appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form (
            key: _form,
               child: SingleChildScrollView(
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                              height: 20.0, ),
                      Text(
                        'LOGIN',
                        style: GoogleFonts.secularOne(fontSize: 50 , fontWeight: FontWeight.w800, color: Color.fromRGBO(4, 88, 125,4))
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


                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(labelText: 'Password',
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                })
                                ; }
                          ),
                          prefixIcon: Icon (
                            Icons.lock,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (password) {
                          //Validator
                        },
                        validator: (password) {
                          if ( password!.isEmpty ||
                              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(password)) {
                            return 'Enter a valid Password!'
                            ;
                          }
                          return null;
                        },
                      ),   //pass
                      SizedBox(
                        height: 15.0,
                      ),

                      Container(
                        width: double.infinity,
                        color: Colors.blue,
                        child: MaterialButton(

                          onPressed: (){
                            if(_form.currentState!.validate())
                            {
                              final snackbar = SnackBar(content: Text('Logging..'));
                            }
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
                              Navigator.of(context).pushReplacementNamed('/Register_Screen');
                            },
                            child: Text(
                              'Register Now',
                            ),
                          ),
                        ],
                      ),
                    ]
            )
        )
    ),
    )
    );
  }

}