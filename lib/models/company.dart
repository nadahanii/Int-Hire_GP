class Company {
   int? id;
   String? name;
   String? description;
   String? street;
   String? city;
   String? country;

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
