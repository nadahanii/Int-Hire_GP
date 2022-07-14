import 'package:flutter/material.dart';
import 'package:history_feature/providers/dummydata_recruiter.dart';

class ProfileScreenRec extends StatefulWidget {
  //final UserPreferences ? user;
  final user = UserPreferencesRec.myUser;
  ProfileScreenRec({Key? key}) : super(key: key);
  static const routeName = '/profile_Screen_Rec';
  @override
  State<ProfileScreenRec> createState() => _ProfileScreenRecState();
}
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(),
    backgroundColor: Color.fromRGBO(4, 88, 125,1),
    elevation: 0,
    title: Text("Profile",
        style: Theme.of(context).textTheme.headline1),
    actions: [
      IconButton(
        icon: Icon(Icons.edit),
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed('/edit_Screen');
        },
      ),
    ],
  );
}


class _ProfileScreenRecState extends State<ProfileScreenRec> {
  int _gender=1;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _postionController = TextEditingController();



  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user.name!;
      _phoneController.text = widget.user.phoneNumber!;
      _passwordController.text = widget.user.password!;
      _cityController.text = widget.user.city!;
      _streetController.text = widget.user.street!;
      _countryController.text = widget.user.country!;
      _birthdayController.text = widget.user.birthDay!;
      if(widget.user.isMale == true)
      {
        _gender = 1;
        _genderController.text = 'Male';
      }else {
        _genderController.text= "Female";
        _gender =0;
      }

      _postionController.text = widget.user.position!;
      _emailController.text = widget.user.email!;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children:
          [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center, //AxisAlignment.center,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Name : ',
                        style:Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _nameController.text,
                        style:Theme.of(context).textTheme.headline4,
                      ),
                    ]


                ),
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Email : ',
                        style:Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _emailController.text,
                        style:Theme.of(context).textTheme.headline4,
                      ),
                    ]


                ),
                const SizedBox(height: 15),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Password : ',
                        style:Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _passwordController.text,
                        style:Theme.of(context).textTheme.headline4,
                      ),
                    ]


                ),
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Phone number : ',
                        style:Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _phoneController.text,
                        style:Theme.of(context).textTheme.headline4,
                      ),
                    ]


                ),
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Street : ',
                        style:Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _streetController.text,
                        style:Theme.of(context).textTheme.headline4,
                      ),
                    ]


                ),
                const SizedBox(height: 15),
                Row(
                  //    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'City : ',
                        style:Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _cityController.text,
                        style:Theme.of(context).textTheme.headline4,
                      ),
                    ]


                ),
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Country : ',
                        style:Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _countryController.text,
                        style:Theme.of(context).textTheme.headline4,
                      ),
                    ]


                ),

                const SizedBox(height: 15),


                Row(
                  //      mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Birthday : ',
                        style:Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _birthdayController.text,
                        style:Theme.of(context).textTheme.headline4,
                      ),
                    ]


                ),

                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Gender : ',
                        style:Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _genderController.text,
                        style:Theme.of(context).textTheme.headline4,
                      ),
                    ]


                ),
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Position : ',
                        style:Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _postionController.text,
                        style:Theme.of(context).textTheme.headline4,
                      ),
                    ]


                ),
              ],
            ),
          ],
        ),
      ),
    );
  }




}
