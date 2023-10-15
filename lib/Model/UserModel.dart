import 'dart:convert';
import 'package:pointeuse/app_config.dart';

class UserModel {
  String? user_id;
  String? user_name;
  String? email;
  String? password;

  UserModel(this.user_id, this.user_name, this.email, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'user_name': user_name,
      'email': email,
      'password': password
    };
    return map;
  }

  factory UserModel.fromJson(String jsonString) {
    // Create a JsonCodec object
    JsonCodec jsonCodec = JsonCodec();

    // Use the 'decode' method to convert the JSON string to a Map<String, dynamic>
    Map<String, dynamic> dataMap = jsonCodec.decode(jsonString);

    // Extract data from the 'dataMap'
    String? userId = dataMap['user_id'];
    String? userName = dataMap['user_name'];
    String? email = dataMap['email'];
    String? password = dataMap['password'];

    // Create and return a UserModel object using the extracted data
    return UserModel(userId, userName, email, password);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['user_id'],
      map['user_name'],
      map['email'],
      map['password'],
    );
  }
}

// Example usage:
/*void main() {
  String jsonData =
      '{"user_id": "123", "user_name": "John", "email": "asma@example.com", "password": "password"}';

  // Create a UserModel object from the JSON string using the 'fromJson' factory method
  UserModel user = UserModel.fromJson(jsonData);

  // Now you can access the properties of the 'user' object
  print('User ID: ${user.user_id}');
  print('User Name: ${user.user_name}');
  print('Email: ${user.email}');
  print('Password: ${user.password}');
}*/
