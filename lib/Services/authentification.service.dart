import 'dart:async'; // Import for using Future
import 'package:http/http.dart' as http;
import 'package:pointeuse/Model/UserModel.dart';
import 'package:pointeuse/Services/path.service.dart';
import 'package:pointeuse/app_constants/AppConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'GenericCRUDRestService.dart'; // For jsonEncode

// Define your UserModel class here if you haven't already.

class Config {
  static final String hostServerPointeuse = "http://127.0.0.1:8080";
  static final String hostServerSecurity = "qa.myrhis.fr/security";
}

class AuthenticationService extends GenericCRUDRestService<UserModel, String> {
  late final String host;
  late final http.Client httpClient;
  var token = "";
  late final SharedPreferences sharedPreferences;

  AuthenticationService(http.Client httpClient, String baseUrl);

  Future<dynamic> login(data) async {
    final response = await httpClient.post(
        '${Config.hostServerSecurity}' as Uri,
        body: data,
        headers: {'Content-Type': 'application/json'});
    token = response.headers["Authorization"]!;
    print(".....................;" + token);
    if (token != "") {
      sharedPreferences.setString(AppConstants.TOKEN, token);
    }
    return response.body;
  }

  Future<dynamic> loginV(data) async {
    final response = await httpClient.post(
        '${Config.hostServerSecurity}/user/techConnexion' as Uri,
        body: data,
        headers: {'Content-Type': 'application/json'});
    return response.body;
  }
}
