import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:history_feature/models/notification.dart' as n;
import 'package:history_feature/providers/auth.dart';
import 'package:http/http.dart' as http;

import '../helpers/components.dart';

class Notifications with ChangeNotifier {
  List<n.Notification> _items = [];
  late String? token;
  late String? userType;

  Notifications(Auth auth) {
    token = auth.token;
    userType = auth.userType;
  }

  List<n.Notification> get items {
    return [..._items];
  }

  n.Notification findById(int id) {
    return _items.firstWhere((job) => job.id == id);
  }

  Future<void> fetchAndSetNotifications() async {
    final url = Uri.parse('${baseUrl}Notification/getAllMessage');
    try {
      final response = await http.get(
        url,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
        },
      );
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData.isEmpty) {
        return;
      }
      final List<n.Notification> loadedJobs = [];
      for (var obj in extractedData) {
        loadedJobs.add(n.Notification.fromJson(obj));
      }
      _items = loadedJobs.reversed.toList();
      notifyListeners();
    } catch (e) {
      print("notification get" + e.toString());
    }
  }

  Future<void> fetchAndSetComplaint() async {
    print(token);
    final url = Uri.parse('${baseUrl}Notification/getAllComplaint');
    try {
      final response = await http.get(
        url,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
        },
      );
      print(response.statusCode.toString() + " complaint");
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData.isEmpty) {
        return;
      }
      final List<n.Notification> loadedJobs = [];
      for (var obj in extractedData) {
        loadedJobs.add(n.Notification.fromJson(obj));
      }
      _items = loadedJobs.reversed.toList();
      notifyListeners();
    } catch (e) {
      print("notification get admin" + e.toString());
    }
  }

  Future<String> addNotifications(n.Notification notification) async {
    var url = Uri.parse('${baseUrl}Notification/PushComplaint');
    if(userType == "Admin"){
      url = Uri.parse('${baseUrl}Notification/PushMessage');
    }
    var encode = json.encode({
      "id": 0,
      "title": notification.title,
      "description": notification.description,
      "receiverEmail": userType == "Admin" ? notification.receiverEmail : 'admin@admin.com',
    });
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
        return json.decode(response.body) as String;
      }
      return 'add notification successfully';
    } catch (error) {
      print("test2 :" + error.toString());
      return error.toString();
    }
  }

  Future<String> viewNotification(n.Notification notification) async {
    var url = Uri.parse('${baseUrl}Notification/NotificationViewed?id=${notification.id}');
    notifyListeners();
    try {
      final response = await http.get(
        url,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
        },
      );
      if (response.statusCode == 400 || response.statusCode == 401) {
        return json.decode(response.body) as String;
      }
      return 'view notification successfully';
    } catch (error) {
      print("view notification :" + error.toString());
      return error.toString();
    }
  }
}