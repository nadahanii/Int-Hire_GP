import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:history_feature/models/notification.dart' as n;
import 'package:http/http.dart' as http;

class Notifications with ChangeNotifier {
  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFbWFpbCI6InVzZXI1NUBleGFtcGxlLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlJlY3J1aXRlciIsImV4cCI6MTY1NzU4MjEyMiwiaXNzIjoidGVzdC5jb20iLCJhdWQiOiJ0ZXN0LmNvbSJ9.9YbM2TTG43ARm3Kpuw_64XusVx9jM2nvTc9ux4tg_6s";
  List<n.Notification> _items = [];

  List<n.Notification> get items {
    print("object");
    return [..._items];
  }

  n.Notification findById(int id) {
    return _items.firstWhere((job) => job.id == id);
  }

  Future<void> fetchAndSetNotifications() async {
    print("notification test");
    final url =
        Uri.parse('https://localhost:44324/api/Notification/getAllMessage');
    try {
      final response = await http.get(
        url,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
        },
      );
      print("notification test2");
      final extractedData = json.decode(response.body) as List<dynamic>;
      print(extractedData);
      if (extractedData.isEmpty) {
        return;
      }
      final List<n.Notification> loadedJobs = [];
      print("test notification");
      for (var obj in extractedData) {

        loadedJobs.add(n.Notification.fromJson(obj));
      }
      _items = loadedJobs.reversed.toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> addNotifications(
      n.Notification notification, String? token) async {
    final url =
        Uri.parse('http://hossam348-001-site1.etempurl.com/api/Job/addJob');
    var encode = json.encode({
      "id": 0,
      "title": notification.title,
      "description": notification.description,
      "date": notification.date,
      "receiverEmail": notification.receiverEmail,
    });
    _items.add(notification);
    notifyListeners();
    try {
      final response = await http.post(
        url,
        body: encode,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
        },
      );
      if (response.statusCode == 400 || response.statusCode == 401) {
        _items.remove(notification);
        notifyListeners();
        return response.body;
      }
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      _items.where((element) => element.id == 0).first.id = responseData['id'];

      return 'add notification successfully';
    } catch (error) {
      print("test2 :" + error.toString());
      rethrow;
    }
  }
}
