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
  late List<String> tagss;
  late List<String> skilss;

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
          .replaceFirst('[', '')
          .replaceFirst(']', '');
      _nameController.text = widget.user!.name;
      _phoneController.text = widget.user!.phoneNumber;
      _cityController.text = widget.user!.city;
      _streetController.text = widget.user!.street;
      _countryController.text = widget.user!.country;
      _birthdayController.text = widget.user!.birthDay;
      _skillsController.text = widget.user!.skills;
      if (widget.user!.isMale) {
        _genderController.text = 'Male';
      }

      if (!widget.user!.isMale) {
        _genderController.text = "Female";
      }
      _militaryStatusController.text = widget.user!.militaryStatus.name;
      _twitternameController.text = widget.user!.twitterUsername;
      _emailController.text = widget.user!.email;
      tagss=  _tagsController.text.split(',');
      skilss= _skillsController.text.split(',');


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
                ///************************************************************************************
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Twitter-based personality type : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        'INFJ',
                        /*_twitternameController.text,*/
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),
                const SizedBox(height: 15),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Test-based personality type : ',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        'INFJ',
                        /*_twitternameController.text,*/
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),
                ///***************************************************************************
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
             Text(
               'Tags : ',
               style: Theme.of(context).textTheme.headline3,
             ),
             SizedBox(
               height: 2,
             ),
             ListView.builder(
             physics: const NeverScrollableScrollPhysics(),
             scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: tagss.length,
          itemBuilder: (_, i) => Column(
              crossAxisAlignment : CrossAxisAlignment.start, //AxisAlignment.center,
              children: [
                Text(
                  '● '+tagss[i],
                  style:Theme.of(context).textTheme.headline4,
                )
          ])
            ),
                const SizedBox(height: 15),
                Text(
                  'Skills : ',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 2,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: skilss.length,
                    itemBuilder: (_, i) => Column(
                       crossAxisAlignment : CrossAxisAlignment.start, //AxisAlignment.center,
                        children: [
                          Text(
                            '● '+skilss[i],
                            style:Theme.of(context).textTheme.headline4,
                          )
                        ])
                ),
                const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
