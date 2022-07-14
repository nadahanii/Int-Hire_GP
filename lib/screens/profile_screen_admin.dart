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
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
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
      _nameController.text = widget.user!.name;
      _phoneController.text = widget.user!.phoneNumber;
      _birthdayController.text = widget.user!.birthDay;
      if (widget.user!.isMale) {
        _genderController.text = 'Male';
      }
      if (!widget.user!.isMale) {
        _genderController.text = "Female";
      }
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
                        'Gender : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _genderController.text,
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
