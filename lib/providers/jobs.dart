import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:history_feature/models/job.dart';
import 'package:http/http.dart' as http;

class Jobs with ChangeNotifier {
  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFbWFpbCI6InVzZXIyMkBleGFtcGxlLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlJlY3J1aXRlciIsImV4cCI6MTY1NzUwOTg1OSwiaXNzIjoidGVzdC5jb20iLCJhdWQiOiJ0ZXN0LmNvbSJ9.LOfkCA-sS2C6Sm4Th7orASMTGVy_LRIFXnJbRBx5LuQ";
  List<Job> _items = [];

  List<Job> get items {
    return [..._items];
  }

  Job findById(int id) {
    return _items.firstWhere((job) => job.id == id);
  }

  Future<void> fetchAndSetJobs() async {
    print("ff");
    final url =
        Uri.parse('http://hossam348-001-site1.etempurl.com/api/Job/getAllJobs');
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
      final List<Job> loadedJobs = [];
      for (var obj in extractedData) {
        loadedJobs.add(Job.fromJson(obj));
      }
      _items = loadedJobs.reversed.toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchAndSetHistoryJobsOfApplicant() async {
    final url = Uri.parse(
        'http://hossam348-001-site1.etempurl.com/api/Job/getApplicantJobs');
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
    final List<Job> loadedJobs = [];
    for (var obj in extractedData) {
      loadedJobs.add(Job.fromJson(obj));
    }
    _items = loadedJobs.reversed.toList();
    notifyListeners();
  }

  Future<void> fetchAndSetJobsOfRecruiter() async {
    print("dd");
    final url = Uri.parse(
        'http://hossam348-001-site1.etempurl.com/api/Job/getRecruiterJobs');
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
    final List<Job> loadedJobs = [];
    for (var obj in extractedData) {
      loadedJobs.add(Job.fromJson(obj));
    }
    _items = loadedJobs.reversed.toList();
    notifyListeners();
  }

  Future<String> addJob(Job job, String? token) async {
    final url =
        Uri.parse('http://hossam348-001-site1.etempurl.com/api/Job/addJob');
    var encode = json.encode({
      "id": 0,
      "title": job.title,
      "description": job.description,
      "expLevel": int.parse(job.experience),
      "educationLevel": job.educationLevel.index,
      "career": job.careerLevel.index,
      "jobType": job.typeOfJob.index,
      "salary": int.parse(job.salary),
      "requirements": job.requirements,
      "deadline": job.endDate,
      "posting_Time": job.publishDate,
      "tags": job.tags,
    });
    _items.add(job);
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
        _items.remove(job);
        notifyListeners();
        return response.body;
      }
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      _items.where((element) => element.id == 0).first.id = responseData['id'];

      return 'add job successfully';
    } catch (error) {
      print("test2 :" + error.toString());
      rethrow;
    }
  }

  Future<String> removeJob(Job job) async {
    _items.remove(job);
    var url = Uri.parse(
        'http://hossam348-001-site1.etempurl.com/api/Job/deleteJob?id=${job.id}');
    notifyListeners();
    final response = await http.delete(
      url,
      headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer $token',
        "Accept": "application/json",
      },
    );
    if (response.statusCode >= 400) {
      _items.add(job);
      notifyListeners();
      return 'Could not delete product.';
    }
    return 'Operation is done';
  }

  Future<String> updateJob(Job job, String? token) async {
    _items.removeWhere((element) {
      return element.id == job.id;
    });
    final url =
        Uri.parse('http://hossam348-001-site1.etempurl.com/api/Job/updateJob');
    var encode = json.encode({
      "id": job.id,
      "title": job.title,
      "description": job.description,
      "expLevel": int.parse(job.experience),
      "educationLevel": job.educationLevel.index,
      "career": job.careerLevel.index,
      "jobType": job.typeOfJob.index,
      "salary": int.parse(job.salary),
      "requirements": job.requirements,
      "deadline": job.endDate,
      "posting_Time": job.publishDate,
      "tags": job.tags
    });
    _items.add(job);
    notifyListeners();
    try {
      final response = await http.put(
        url,
        body: encode,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
        },
      );
      if (response.statusCode == 400 || response.statusCode == 401) {
        print("update test 2");
        _items.remove(job);
        notifyListeners();
        return response.body;
      }
      print("update test 3" + response.statusCode.toString());
      return 'update job successfully';
    } catch (error) {
      print("test2 :" + error.toString());
      rethrow;
    }
  }
}
