/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pointeuse/Model/UserModel.dart';
import 'package:pointeuse/Services/LoginService.dart';
import 'package:http/http.dart' as http;

class LoginController extends ChangeNotifier {
  final LoginService _loginService = LoginService();
  UserModel? _user;
  String _responseText = "";

  UserModel? get user => _user;
  String get responseText => _responseText;

  Future<void> login(String email, String password) async {
    try {
      final http.Response response = await _loginService.login(email, password);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        _user = UserModel.fromJson(jsonResponse);
      } else if (response.statusCode == 400) {
        _responseText = "Password is incorrect";
      } else if (response.statusCode == 401) {
        _responseText = "Email doesn't exist";
      } else {
        _responseText = "An error occurred. Please try again!";
      }

      notifyListeners();
    } catch (e) {
      _responseText = e.toString();
      notifyListeners();
    }
  }
}*/
