import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:history_feature/models/recruiter_user.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/applicant_user.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  Timer? _authTimer;
  String? _userType;
  ApplicantUser? _applicant;
  RecruiterUser? _recruiter;

  String? get userType {
    return _userType;
  }

  Object? get userObject {
    if (_userType == "Applicant") {
      return _applicant;
    } else if (_userType == "Recruiter") {
      return _recruiter;
    } else {
      return null;
    }
  }

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<String> _authenticate(String encode, String method) async {
    final url = Uri.parse('https://localhost:44324/api/account/$method');
    print(url);
    try {
      final response = await http.post(
        url,
        body: encode,
        headers: {
          "content-type": "application/json",
          "Accept": "application/json",
        },
      );
      if (response.statusCode == 400 || response.statusCode == 401) {
        return json.decode(response.body);
      }
      final responseData = json.decode(response.body);
      _token = responseData['token'];
      _expiryDate =
          DateFormat('dd-MM-yyyy hh:mm aaa').parse(responseData['expiration']);
      _userType = responseData['userType'];
      if (_userType == "Applicant") {
        _applicant = ApplicantUser.fromJson(responseData["userDate"]);
      } else if (_userType == "Recruiter") {
        _recruiter = RecruiterUser.fromJson(responseData["userDate"]);
      } else {}
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'expiration': _expiryDate!.toIso8601String(),
          'userType': responseData['userType'],
          'user': responseData["userDate"],
        },
      );
      prefs.setString('userData', userData);
      return 'login successfully';
    } catch (error) {
      print("test2 :" + error.toString());
      rethrow;
    }
  }

  Future<String> signup(String data) async {
    return _authenticate(data, "registerApplicant");
  }

  Future<String> login(String data) async {
    return _authenticate(data, "Login");
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      print("auto f");
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, Object>;
    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'] as String);
    if (expiryDate.isBefore(DateTime.now())) {
      print("auto ff");
      return false;
    }
    _token = extractedUserData['token'] as String;
    print("fddd" + _token!);
    _expiryDate = expiryDate;
    _userType = extractedUserData['userType'] as String;

    if (_userType == "Applicant") {
      _applicant = ApplicantUser.fromJson(
          extractedUserData["userDate"] as Map<String, dynamic>);
    } else if (_userType == "Recruiter") {
      _recruiter = RecruiterUser.fromJson(
          extractedUserData["userDate"] as Map<String, dynamic>);
    } else {}
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
