import 'company.dart';

class RecruiterUser {
  late String name;
  late String email;
  late String phoneNumber;
  late String password;
  late String street;
  late String city;
  late String country;
  late String birthDay;
  late bool isMale;
  late String position;
 // late Company company;

  RecruiterUser({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.street,
    required this.city,
    required this.country,
    required this.position,
   // required this.company,
    required this.birthDay,
    required this.isMale,
  });

  RecruiterUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = '';
    street = json['street'];
    city = json['city'];
    country = json['country'];
    birthDay = json['birthDay'];
    isMale = ((json['gender'] as int) == 1) ? true : false;
    position = json['position'];
  //  company = Company.fromJson(json['company'] as Map<String, dynamic>);
  }
}
