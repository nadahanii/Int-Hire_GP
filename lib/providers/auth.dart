import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  Timer? _authTimer;

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
    final url = Uri.parse(
        'http://hossam348-001-site1.etempurl.com/api/account/$method');
    try {
      final response = await http.post(
        url,
        body: encode,
        headers: {
          "content-type": "application/json",
        },
      );
      if(response.statusCode == 400 || response.statusCode == 401){
        return response.body;
      }
      final responseData = json.decode(response.body);
      _token = responseData['token'];
      _expiryDate =
          DateFormat('dd-MM-yyyy hh:mm aaa').parse(responseData['expiration']);
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'expiration': _expiryDate!.toIso8601String(),
          'userType' : responseData['userType'],
        },
      );
      prefs.setString('userData', userData);
      return 'login successfully';
    } catch (error) {
      print("test2 :" + error.toString());
      rethrow;
    }
  }

  Future<String> signup(
      String data) async {
    return _authenticate(
        data,
        "registerApplicant");
  }

  Future<String> login(String data) async {
    return _authenticate(
        data,
        "Login");
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, Object>;
    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'] as String);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'] as String;
    _expiryDate = expiryDate;
    print("test10 : " + _token.toString());
    print("test10 : " + _expiryDate.toString());
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
