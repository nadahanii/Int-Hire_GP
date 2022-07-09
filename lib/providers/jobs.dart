import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:history_feature/models/job.dart';
import 'package:http/http.dart' as http;

class Jobs with ChangeNotifier {
  List<Job> _items = [
  ];

  List<Job> get items {
    return [..._items];
  }

  Job findById(String id) {
    return _items.firstWhere((job) => job.id == id);
  }

  Future<String> addJob(Job job, String? token) async {
    final url = Uri.parse(
        'http://hossam348-001-site1.etempurl.com/api/Job/addJob');
    var encode =  json.encode(
        {
          "id": 0,
          "title": job.title,
          "description": job.description,
          "expLevel":  int.parse(job.experience),
          "educationLevel": job.educationLevel.index,
          "career": job.careerLevel.index,
          "jobType": job.typeOfJob.index,
          "salary":  int.parse(job.salary),
          "requirements": job.requirements,
          "deadline": job.endDate,
          "posting_Time": job.publishDate,
          "tags": job.tags
        } );
    print(encode);
    _items.add(job);
    notifyListeners();
    try {
      final response = await http.post(
        url,
        body: encode,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $token'
        },
      );
      if(response.statusCode == 400 || response.statusCode == 401){
        print("dwpdcwkpocdfkewopcke");
        _items.remove(job);
        notifyListeners();
        return response.body;
      }
      return 'add job successfully';
    } catch (error) {
      print("test2 :" + error.toString());
      rethrow;
    }
  }

  void removeJob(Job job) {
    _items.remove(job);
    notifyListeners();
  }

  Future<String> updateJob(Job job, String? token) async {
    _items.removeWhere((element) {
      return element.id == job.id;
    });
    final url = Uri.parse(
        'http://hossam348-001-site1.etempurl.com/api/Job/updateJob');
    var encode =  json.encode(
        {
          "id": 0,
          "title": job.title,
          "description": job.description,
          "expLevel":  int.parse(job.experience),
          "educationLevel": job.educationLevel.index,
          "career": job.careerLevel.index,
          "jobType": job.typeOfJob.index,
          "salary":  int.parse(job.salary),
          "requirements": job.requirements,
          "deadline": job.endDate,
          "posting_Time": job.publishDate,
          "tags": job.tags
        } );
    print(encode);
    _items.add(job);
    notifyListeners();
    try {
      final response = await http.put(
        url,
        body: encode,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $token'
        },
      );
      if(response.statusCode == 400 || response.statusCode == 401){
        _items.remove(job);
        notifyListeners();
        return response.body;
      }
      return 'update job successfully';
    } catch (error) {
      print("test2 :" + error.toString());
      rethrow;
    }
  }
}
