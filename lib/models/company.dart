import 'job.dart';

enum MilitaryStatus { Postponed, Exempted, Completed, NotApplicable }

class Company {
  late int id;
  late String name;
  late String description;
  late String street;
  late String city;
  late String country;

  Company({
    required this.id,
    required this.name,
    required this.description,
    required this.street,
    required this.city,
    required this.country,
  });

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    street = json['street'];
    city = json['city'];
    country = json['country'];
    id = json['id'] as int;
    description = json['description'];
  }
}
