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
import 'package:history_feature/models/applicant_data_for_result.dart';

class ProfileViewScreen extends StatefulWidget {
  final Pair<ApplicantUser,ApplicantResInfo> user;
  ProfileViewScreen({Key? key, required this.user}) : super(key: key);
  static const routeName = '/viewprofile_Screen';
  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  int _gender=1;
  var genderController= TextEditingController();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(),
      backgroundColor: Color.fromRGBO(4, 88, 125, 1),
      elevation: 0,
      centerTitle: true,
      title: Text("Profile", style: Theme.of(context).textTheme.headline1),
    );
  }
    void assignGender()
    {
      if(widget.user.item1.isMale)
        genderController.text='Male';
      else
        genderController.text='Female';


    }
    @override
  Widget build(BuildContext context) {
    assignGender();
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
                        widget.user.item1.name,
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
                        widget.user.item1.email,
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
                        widget.user.item1.phoneNumber,
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
                        widget.user.item1.street,
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
                        widget.user.item1.city,
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
                        widget.user.item1.country,
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
                        widget.user.item1.educationLevel.name,
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
                        widget.user.item1.militaryStatus.name,
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
                        widget.user.item1.birthDay,
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
                        widget.user.item1.twitterUsername,
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
                        genderController.text,
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
                        widget.user.item1.tags.toString(),
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
                        widget.user.item1.skills,
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