class AdminUser {
  late String name;
  late String email;
  late String phoneNumber;
  late String password;
  late String birthDay;
  late bool isMale;

  AdminUser({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.password = '',
    required this.birthDay,
    required this.isMale,
  });

  AdminUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = '';
    birthDay = json['birthDay'];
    isMale = ((json['gender'] as int) == 1) ? true : false;
  }
}
