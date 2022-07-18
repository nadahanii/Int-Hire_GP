import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:history_feature/models/recruiter_user.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/components.dart';
import '../models/admin_user.dart';
import '../models/applicant_user.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  Timer? _authTimer;
  String? _userType;
  ApplicantUser? _applicant;
  RecruiterUser? _recruiter;
  AdminUser? _admin;

  String? get userType {
    return _userType;
  }

  Object? get userObject {
    if (_userType == "Applicant") {
      return _applicant;
    } else if (_userType == "Recruiter") {
      return _recruiter;
    } else {
      return _admin;
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
    print(encode);
    final url = Uri.parse('${baseUrl}account/$method');
    try {
      final response = await http.post(
        url,
        body: encode,
        headers: {
          "content-type": "application/json",
          "Accept": "application/json",
        },
      );
      print(response.body + " " + response.statusCode.toString());
      if (response.statusCode == 400 || response.statusCode == 401) {
        return json.decode(response.body);
      }
      print(response.body + " register");
      final responseData = json.decode(response.body);
      _token = responseData['token'];
      _expiryDate =
          DateFormat('dd-MM-yyyy hh:mm aaa').parse(responseData['expiration']);
      _userType = responseData['userType'];
      if (_userType == "Applicant") {
        _applicant = ApplicantUser.fromJson(responseData["userDate"]);
      } else if (_userType == "Recruiter") {
        _recruiter = RecruiterUser.fromJson(responseData["userDate"]);
      } else {
        _admin = AdminUser.fromJson(responseData["userDate"]);
      }
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
      print("auto catch :" + error.toString());
      return error.toString();
    }
  }

  Future<String> signup(String data, String userType) async {
    if (userType == "Recruiter") {
      return _authenticate(data, "registerRecruiter");
    } else {
      return _authenticate(data, "registerApplicant");
    }
  }

  Future<String> login(String data) async {
    return _authenticate(data, "Login");
  }

  Future<String> updateApplicant(String encode) async {
    final url = Uri.parse('${baseUrl}account/UpdateApplicantUserInfo');
    try {
      final response = await http.post(
        url,
        body: encode,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $_token',
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
      _userType = "Applicant";
      _applicant = ApplicantUser.fromJson(responseData["userDate"]);
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
      return 'update successfully';
    } catch (error) {
      print("update catch :" + error.toString());
      return error.toString();
    }
  }

  Future<String> updateRecruiter(String encode) async {
    final url = Uri.parse('${baseUrl}account/UpdateRecruiterUserInfo');
    try {
      final response = await http.post(
        url,
        body: encode,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $_token',
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
      _userType = "Recruiter";
      _recruiter = RecruiterUser.fromJson(responseData["userDate"]);
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
      return 'update successfully';
    } catch (error) {
      print("update recruiter catch :" + error.toString());
      return error.toString();
    }
  }

  Future<String> updateApplicantTestType(String type) async {
    final url = Uri.parse('${baseUrl}account/addTestPersonality');
    try {
      final response = await http.post(
        url,
        body: json.encode(type),
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $_token',
          "Accept": "application/json",
        },
      );
      if (response.statusCode == 400 || response.statusCode == 401) {
        return json.decode(response.body);
      }
      final responseData = json.decode(response.body);
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      _applicant?.testPersonalityType = type;
      int male;
      if (_applicant!.isMale) {
        male = 1;
      } else {
        male = 0;
      }

      final userData = json.encode({
        'token': _token,
        'expiration': _expiryDate!.toIso8601String(),
        'userType': _userType,
        'user': {
          "userType": "applicant",
          "email": _applicant?.email,
          "name": _applicant?.name,
          "phoneNumber": _applicant?.phoneNumber,
          "birthDay": _applicant?.birthDay,
          "gender": male,
          "militaryStatus": _applicant?.militaryStatus.index,
          "educationLevel": _applicant?.educationLevel.index,
          "city": _applicant?.city,
          "street": _applicant?.street,
          "country": _applicant?.country,
          "twitterUsername": _applicant?.twitterUsername,
          "skills": _applicant?.skills,
          "testPersonality": type,
          "twitterPersonality": _applicant?.socialMediaPersonalityType,
          "tags": _applicant?.tags,
        },
      });
      prefs.setString('userData', userData);
      return responseData;
    } catch (error) {
      print("update test type catch :" + error.toString());
      return error.toString();
    }
  }

  Future<String> updateApplicantTwitterType() async {
    final url = Uri.parse('${baseUrl}account/addTwitterPersonality');
    try {
      final response = await http.post(
        url,
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $_token',
          "Accept": "application/json",
        },
      );
      if (response.statusCode == 400 || response.statusCode == 401) {
        return json.decode(response.body);
      }
      final responseData = json.decode(response.body);
      final prefs = await SharedPreferences.getInstance();
      _applicant?.socialMediaPersonalityType = responseData['type'] as String;
      int male;
      if (_applicant!.isMale) {
        male = 1;
      } else {
        male = 0;
      }
      notifyListeners();
      final userData = json.encode({
        'token': _token,
        'expiration': _expiryDate!.toIso8601String(),
        'userType': _userType,
        'user': {
          "userType": "applicant",
          "email": _applicant?.email,
          "name": _applicant?.name,
          "phoneNumber": _applicant?.phoneNumber,
          "birthDay": _applicant?.birthDay,
          "gender": male,
          "militaryStatus": _applicant?.militaryStatus.index,
          "educationLevel": _applicant?.educationLevel.index,
          "city": _applicant?.city,
          "street": _applicant?.street,
          "country": _applicant?.country,
          "twitterUsername": _applicant?.twitterUsername,
          "skills": _applicant?.skills,
          "testPersonality": _applicant?.testPersonalityType,
          "twitterPersonality": _applicant?.socialMediaPersonalityType,
          "tags": _applicant?.tags,
        },
      });
      prefs.setString('userData', userData);
      return responseData["type"];
    } catch (error) {
      print("update social type catch :" + error.toString());
      return error.toString();
    }
  }

  Future<String> ChangePassword(String oldPassword, String newPassword) async {
    final url = Uri.parse('${baseUrl}account/ChangePassword');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        }),
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer $_token',
          "Accept": "application/json",
        },
      );
      if (response.statusCode == 400 || response.statusCode == 401) {
        return json.decode(response.body);
      }
      return "Password changed successfully";
    } catch (error) {
      print("change password catch :" + error.toString());
      return error.toString();
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    try {
      final extractedUserData =
          json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
      final expiryDate =
          DateTime.parse(extractedUserData['expiration'] as String);
      if (expiryDate.isBefore(DateTime.now())) {
        return false;
      }
      _token = extractedUserData['token'] as String;
      _expiryDate = expiryDate;
      _userType = extractedUserData['userType'] as String;
      print(" " + (_userType ?? " test"));
      if (_userType == "Applicant") {
        _applicant = ApplicantUser.fromJson(
            extractedUserData["user"] as Map<String, dynamic>);
      } else if (_userType == "Recruiter") {
        _recruiter = RecruiterUser.fromJson(
            extractedUserData["user"] as Map<String, dynamic>);
      } else {
        _admin = AdminUser.fromJson(
            extractedUserData["user"] as Map<String, dynamic>);
      }
      notifyListeners();
      _autoLogout();
      return true;
    } catch (e) {
      print("auto " + e.toString());
      return false;
    }
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
