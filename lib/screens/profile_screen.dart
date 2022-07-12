import 'package:flutter/material.dart';
import 'package:history_feature/models/applicant_user.dart';

import '../helpers/pair.dart';
import '../models/job.dart';
import '../widgets/main_drawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.isApplicant}) : super(key: key);
  static const routeName = '/profile_Screen';
  final bool isApplicant;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

List<Widget> returnAppBarActions(BuildContext context) {
  return [
    IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.delete),
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Delete Confirmation"),
              content: const Text("Are you sure you want to delete this item?"),
              actions: [
                TextButton(onPressed: () {}, child: const Text("Delete")),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
              ],
            );
          },
        ).then((value) {});
      },
    )
  ];
}

class _ProfileScreenState extends State<ProfileScreen> {
  Education _userEducation = Education.Bachelors;
  MilitaryStatus _userMilitaryStatus = MilitaryStatus.Postponed;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: returnAppBarActions(context),
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 17, right: 17, top: 15, bottom: 12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Text(
                      'user name',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Text(
                      'user email',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 250),
                    child: Text(
                      'user phone number',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 220),
                    child: Text(
                      'user street',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 220),
                    child: Text(
                      'user city',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 220),
                    child: Text(
                      'user country',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Text(
                      'Education level : ' + _userEducation.name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Text(
                      'Military Status : ' + _userMilitaryStatus.name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Text(
                      'user twitter username',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Text(
                      'user date of birth : '+ '06/04/1999',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 220),
                    child: Text(
                      'user tags/interests',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
