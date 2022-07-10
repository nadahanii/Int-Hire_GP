import 'job.dart';

enum MilitaryStatus { Postponed, Exempted, Completed, NotApplicable }

class ApplicantUser {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String street;
  final String city;
  final String country;
  final Education educationLevel;
  final MilitaryStatus militaryStatus;
  final String twitterUsername;
  final String birthDay;
  final bool isMale;

  ApplicantUser(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.street,
      required this.city,
      required this.country,
      required this.educationLevel,
      required this.militaryStatus,
      this.twitterUsername = "",
      required this.birthDay,
      required this.isMale});
}
