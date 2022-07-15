import 'company.dart';

class RecruiterUser {
   String? name;
   String? email;
   String? phoneNumber;
   String? password;
   String? street;
   String? city;
   String? country;
   String? birthDay;
   bool? isMale;
   String? position;
   Company? company;

  RecruiterUser({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.street,
    required this.city,
    required this.country,
    this.position = '',
    this.company = null,
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
    company = Company.fromJson(json['company'] as Map<String, dynamic>);
  }
}
