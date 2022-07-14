/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/screens/edit_profile.dart';
import 'package:history_feature/widgets/profile_widget.dart';
import 'package:history_feature/screens/settings_page.dart';
import '../helpers/pair.dart';
import '../models/applicant_user.dart';
import '../helpers/pair.dart';
import '../models/job.dart';
import 'package:history_feature/models/applicant_data_for_result.dart';

class ProfileViewScreen extends StatefulWidget {
  final ApplicantResInfo? user;
  ProfileViewScreen({Key? key, this.user}) : super(key: key);
  static const routeName = '/viewprofile_Screen';
  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  int _gender = 1;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _twitternameController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
  final _tagsController = TextEditingController();
  final _educationController = TextEditingController();
  final _militaryStatusController = TextEditingController();
  final _genderController = TextEditingController();
  final _skillsController = TextEditingController();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(),
      backgroundColor: Color.fromRGBO(4, 88, 125, 1),
      elevation: 0,
      title: Text("Profile", style: Theme.of(context).textTheme.headline1),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _educationController.text = widget.user!.educationLevel.name;
      _tagsController.text = widget.user!.tags.toSet().toString();
      _nameController.text = widget.user!.name;
      _phoneController.text = widget.user!.phoneNumber;
      _passwordController.text = widget.user!.password;
      _cityController.text = widget.user!.city;
      _streetController.text = widget.user!.street;
      _countryController.text = widget.user!.country;
      _birthdayController.text = widget.user!.birthDay;
      _skillsController.text= widget.user!.Skills;
      if (widget.user!.isMale) {
        _gender = 1;
        _genderController.text = 'Male';
      }

      if (!widget.user!.isMale) {
        _genderController.text = "Female";
        _gender = 0;
      }
      _militaryStatusController.text = widget.user!.militaryStatus.name;
      _twitternameController.text = widget.user!.twitterUsername;
      _emailController.text = widget.user!.email;
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
                    ]),
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
                    ]),
                const SizedBox(height: 15),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Password : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _passwordController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),
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
                    ]),
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
                    ]),
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
                    ]),
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
                    ]),
                const SizedBox(height: 15),
                Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Educational Level : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _educationController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),
                const SizedBox(height: 15),
                Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'militaryStatus : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _militaryStatusController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),
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
                    ]),
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Twitter Name : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _twitternameController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),
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
                    ]),
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tags :',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _tagsController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Skills : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _skillsController.text,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),
                const SizedBox(height: 15),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/