import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';
import 'package:history_feature/screens/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  ApplicantUser? user;
  ProfileScreen({Key? key, this.user}) : super(key: key);
  static const routeName = '/profile_Screen';
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _twitternameController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
  final _tagsController = TextEditingController();
  final _educationController = TextEditingController();
  final _militaryStatusController = TextEditingController();
  final _genderController = TextEditingController();
  final _skillsController = TextEditingController();
  final _socialpersonalityController = TextEditingController();
  final _testpersonalityController = TextEditingController();
  late List<String> tagss=[];
  late List<String> skilss=[];

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,

      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
                    builder: (context) =>
                        EditProfilePage(user: widget.user)));
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _educationController.text = widget.user!.educationLevel.name;
      _tagsController.text = widget.user!.tags
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '').replaceAll(',', ' -');
      _nameController.text = widget.user!.name;
      _phoneController.text = widget.user!.phoneNumber;
      _cityController.text = widget.user!.city;
      _streetController.text = widget.user!.street;
      _countryController.text = widget.user!.country;
      _birthdayController.text = widget.user!.birthDay;
      _skillsController.text = widget.user!.skills.replaceAll(',', '-');
      _socialpersonalityController.text = widget.user!.socialMediaPersonalityType;
      _testpersonalityController.text = widget.user!.testPersonalityType;
      if (widget.user!.isMale) {
        _genderController.text = 'Male';
      }

      if (!widget.user!.isMale) {
        _genderController.text = "Female";
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
                  CrossAxisAlignment.start, //AxisAlignment.center,
              children: [
                Card(
                  child: ListTile(
                    title: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _nameController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _emailController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Phone',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _phoneController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Birthday',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _birthdayController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Street',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _streetController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'City',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _cityController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Country',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _countryController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Education Level',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _educationController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Social Personality Type',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _socialpersonalityController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Test Personality Type',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _testpersonalityController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Military Status',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _militaryStatusController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Gender',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _genderController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Twitter name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        _twitternameController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
               child: ListTile(
                 title: Text(
                   'Tags',
                   style: TextStyle(fontWeight: FontWeight.bold),
                 ),
                 subtitle:
                   Text( _tagsController.text,)

             )),
                Card(
                    child: ListTile(
                      title: Text(
                        'Skills',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                      Text(
                         _skillsController.text,
                      )
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
