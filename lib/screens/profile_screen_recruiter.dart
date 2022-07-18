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

  final _genderController = TextEditingController();

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
    if (widget.user.isMale!) {
      _genderController.text = 'Male';
    }
    if (!widget.user.isMale!) {
      _genderController.text = "Female";
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
                    subtitle: Text(widget.user.name!,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.email!,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Phone',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.phoneNumber!,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Position',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.position!,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Birthday',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.birthDay!,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Street',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.street!,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'City',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.city!,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Country',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.country!,
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
                    subtitle: Text(widget.user.company!.name!,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Company Street Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.company!.street!,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Company City Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.company!.city!,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Company Country Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.company!.country!,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Description Of Company',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.user.company!.description!,
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
