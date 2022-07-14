import 'job.dart';

enum MilitaryStatus { Postponed, Exempted, Completed, NotApplicable }

class ApplicantUser {
  late String name;
  late String email;
  late String phoneNumber;
  late String password;
  late String street;
  late String city;
  late String country;
  late Education educationLevel;
  late MilitaryStatus militaryStatus;
  late String twitterUsername;
  late String birthDay;
  late bool isMale;
  late String Skills;
  late List<String> tags;

  ApplicantUser(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.street,
      required this.city,
      required this.country,
      this.educationLevel = Education.High_School,
      this.militaryStatus = MilitaryStatus.NotApplicable,
      this.twitterUsername = "",
      required this.birthDay,
      required this.isMale,
      this.Skills = '',
      this.tags = const []});

  ApplicantUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = '';
    street = json['street'];
    city = json['city'];
    country = json['country'];
    educationLevel = Education.values[json['educationLevel']];
    militaryStatus = MilitaryStatus.values[json['militaryStatus']];
    twitterUsername = json['twitterUsername'] ?? "";
    birthDay = json['birthDay'];
    isMale = ((json['gender'] as int) == 1) ? true : false;
    tags = json['tags'].cast<String>();
  }
}
