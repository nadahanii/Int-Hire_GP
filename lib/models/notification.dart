import 'package:history_feature/models/test.dart';

class Notification {
  late int id;
  late String title;
  late String description;
  late String date;
  late String receiverEmail;
  late bool viewed;

  Notification(
      {required this.id,
      required this.title,
      required this.description,
      required this.receiverEmail,
      required this.date,
      required this.viewed});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'];
    description = json['description'];
    date = json['date'];
    receiverEmail = json['sender'];
    viewed = json['viewed'] as bool;
  }
}
