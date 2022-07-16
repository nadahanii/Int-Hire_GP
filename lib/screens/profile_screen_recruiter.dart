import 'package:flutter/material.dart';
import 'package:history_feature/models/recruiter_user.dart';
import 'package:history_feature/screens/edit_profile_recruiter.dart';

class ProfileRecScreen extends StatefulWidget {
  final RecruiterUser user;
  ProfileRecScreen({Key? key, required this.user}) : super(key: key);
  static const routeName = '/profileRec_Screen';
  @override
  State<ProfileRecScreen> createState() => _ProfileRecScreenState();
}

class _ProfileRecScreenState extends State<ProfileRecScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _companyStreetController = TextEditingController();
  final _companyCityController = TextEditingController();
  final _companyCountryController = TextEditingController();
  final _companyDescriptionController = TextEditingController();
  final _positionController = TextEditingController();
  final _companyNameController = TextEditingController();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      //leading: BackButton(),
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
                        EditProfileRecPage(user: widget.user)));
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user.name!;
      _phoneController.text = widget.user.phoneNumber!;
      _emailController.text = widget.user.email!;
      _cityController.text = widget.user.city!;
      _streetController.text = widget.user.street!;
      _countryController.text = widget.user.country!;
      _birthdayController.text = widget.user.birthDay!;
      _positionController.text = widget.user.position!;
      if (widget.user.isMale!) {
        _genderController.text = 'Male';
      }
      if (!widget.user.isMale!) {
        _genderController.text = "Female";
      }
      _companyCityController.text = widget.user.company!.city!;
      _companyCountryController.text = widget.user.company!.country!;
      _companyStreetController.text = widget.user.company!.street!;
      _companyDescriptionController.text = widget.user.company!.description!;
      _companyNameController.text = widget.user.company!.name!;

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
                Card(
                  child: ListTile(
                    title: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_nameController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_emailController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Phone',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_phoneController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Position',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_positionController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Birthday',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_birthdayController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Street',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_streetController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'City',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_cityController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Country',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_countryController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Gender',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_genderController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Company Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_companyNameController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Company Street Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_companyStreetController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Company City Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_companyCityController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Company Country Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_companyCountryController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Description Of Company',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_companyDescriptionController.text,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
