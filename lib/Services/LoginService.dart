/*import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginService  {
  late String _email;
  late String _password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _responseText = "";
  var dbHelper;
  late final http.Client httpClient = http.Client();


  if (email.isEmpty || password.isEmpty) {
  // ... (Your existing code to show empty email/password error)
  } else {
  final Map<String, String> userData = {
  "email": email,
  "password": password,
  };
  final Map<String, String> headers = {
  "Content-Type": "application/json",
  };
  final String jsonData = jsonEncode(userData);

  try {
  final response = await http.post(
  Uri.parse('https://preprod.myrhis.fr/security/user/techConnexion'),
  body: jsonData,
  headers: headers,
  );
}*/
