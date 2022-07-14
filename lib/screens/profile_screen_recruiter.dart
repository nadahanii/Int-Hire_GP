import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/screens/edit_profile.dart';
import 'package:history_feature/widgets/profile_widget.dart';
import 'package:history_feature/screens/settings_page.dart';
import '../helpers/pair.dart';
import '../models/applicant_user.dart';
import '../helpers/pair.dart';
import '../models/job.dart';
import 'package:history_feature/models/recruiter_user.dart';
import 'package:history_feature/screens/edit_profile_recruiter.dart';

class ProfileRecScreen extends StatefulWidget {
  final RecruiterUser? user;
  ProfileRecScreen({Key? key, this.user}) : super(key: key);
  static const routeName = '/profileRec_Screen';
  @override
  State<ProfileRecScreen> createState() => _ProfileRecScreenState();
}

class _ProfileRecScreenState extends State<ProfileRecScreen> {
  int _gender =1;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _companyStreetController = TextEditingController();
  final _companyCityController = TextEditingController();
  final _companyCountryController = TextEditingController();
  final _companyDescriptionController = TextEditingController();
  final _companyIDController = TextEditingController();
  final _positionController = TextEditingController();
  final _companyNameController = TextEditingController();


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(),
      backgroundColor: Color.fromRGBO(4, 88, 125, 1),
      elevation: 0,
      title: Text("Profile", style: Theme.of(context).textTheme.headline1),
      actions: [
        IconButton(
          icon: Icon(Icons.edit),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProfileRecPage(user: widget.user,))
            );
          },
        ),
      ],
    );
  }

  final List<Pair<String, int>> _genderList = const [
    Pair('female', 0),
    Pair('male', 1),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user!.name!;
      _phoneController.text = widget.user!.phoneNumber!;
      _emailController.text = widget.user!.email!;
      _cityController.text = widget.user!.city!;
      _streetController.text = widget.user!.street!;
      _countryController.text = widget.user!.country!;
      _birthdayController.text = widget.user!.birthDay!;
      _positionController.text = widget.user!.position!;
      if (widget.user!.isMale!) {
        _gender = 1;
        _genderController.text = 'Male';
      }

      if (!widget.user!.isMale!) {
        _genderController.text = "Female";
        _gender = 0;
      }
      _companyIDController.text = widget.user!.company!.id.toString();
      _companyCityController.text = widget.user!.company!.city!;
      _companyCountryController.text = widget.user!.company!.country!;
      _companyStreetController.text = widget.user!.company!.street!;
      _companyDescriptionController.text = widget.user!.company!.description!;
      _companyNameController.text = widget.user!.company!.name!;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.center, //AxisAlignment.center,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Name : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _nameController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]), //name
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Email : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _emailController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),  //email
                const SizedBox(height: 15),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Phone number : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _phoneController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),  //phone number
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Street : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _streetController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),   //street
                const SizedBox(height: 15),
                Row(
                  //    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'City : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _cityController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),    //city
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Country : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _countryController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),  //country
                const SizedBox(height: 15),
                Row(
                  //      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Birthday : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _birthdayController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),   //birthday
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Gender : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _genderController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),   //gender
                const SizedBox(height: 15),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Position : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _positionController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]), //position
                const SizedBox(height: 15),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Company Name : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _companyNameController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]), //name company
                const SizedBox(height: 15),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Description Of Company : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _companyDescriptionController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]), //des
                const SizedBox(height: 15),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Street Of Company : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _companyStreetController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]), //street comp
                const SizedBox(height: 15),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'City Of Company : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _companyCityController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]), //city comp
                const SizedBox(height: 15),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Country Of Company : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _companyCountryController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]), //country comp
                const SizedBox(height: 15),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
