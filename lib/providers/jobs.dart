import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:history_feature/models/job.dart';
import 'package:history_feature/providers/auth.dart';
import 'package:http/http.dart' as http;

class Jobs with ChangeNotifier {
  List<Job> _items = [];
  late String? token;
  late String? userType;

  Jobs(Auth auth) {
    print(auth.token);
    token = auth.token;
    userType = auth.userType;
  }

  List<Job> get items {
    return [..._items];
  }

  Job findById(int id) {
    return _items.firstWhere((job) => job.id == id);
  }

  Future<void> fetchAndSetJobs() async {
    print(token);
    final url = Uri.parse('https://localhost:44324/api/Job/getAllJobs');
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
    final url = Uri.parse('https://localhost:44324/api/Job/getApplicantJobs');
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
    final url = Uri.parse('https://localhost:44324/api/Job/getRecruiterJobs');
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
    print(" add job");
    print(token);
    final url = Uri.parse('https://localhost:44324/api/Job/addJob');
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
      print(encode + " befor job");
      final response = await http.post(
        url,
        body: encode,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
        },
      );
      print(encode + " after job");
      if (response.statusCode == 400 || response.statusCode == 401) {
        _items.remove(job);
        notifyListeners();
        return response.body;
      }
      print(response.statusCode.toString() + "add job ");
      print(response.body + "add job ");
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      print(responseData);
      _items.where((element) => element.id == 0).first.id = (responseData['id'] as int);

      return 'add job successfully';
    } catch (error) {
      print("test2 add job:" + error.toString());
      rethrow;
    }
  }

  Future<String> removeJob(Job job) async {
    _items.remove(job);
    var url =
        Uri.parse('https://localhost:44324/api/Job/deleteJob?id=${job.id}');
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
    final url = Uri.parse('https://localhost:44324/api/Job/updateJob');
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
