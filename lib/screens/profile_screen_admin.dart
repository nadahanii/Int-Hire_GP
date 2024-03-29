import 'package:flutter/material.dart';
import 'package:history_feature/models/admin_user.dart';

class ProfileAdminScreen extends StatefulWidget {
  AdminUser? user;
  ProfileAdminScreen({Key? key, this.user}) : super(key: key);
  static const routeName = '/profile_admin_screen';
  @override
  State<ProfileAdminScreen> createState() => _ProfileAdminScreenState();
}

class _ProfileAdminScreenState extends State<ProfileAdminScreen> {
  final _genderController = TextEditingController();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      title: Text("Profile", style: Theme.of(context).textTheme.headline1),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {

      if (widget.user!.isMale) {
        _genderController.text = 'Male';
      }
      if (!widget.user!.isMale) {
        _genderController.text = "Female";
      }

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
                    subtitle: Text(
                        widget.user!.name,
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
                        widget.user!.email,
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
                        widget.user!.phoneNumber,
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
                        widget.user!.birthDay,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
