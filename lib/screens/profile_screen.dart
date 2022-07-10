import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:history_feature/screens/register.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import 'home_screen.dart';
class ProfileScreen extends StatelessWidget {
  static const routeName = '/GetUserInfo';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}