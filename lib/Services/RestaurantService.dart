import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pointeuse/Model/restaurant.model.dart';
import 'package:pointeuse/Services/authentification.service.dart';

class RestaurantService {
  Future<RestaurantModel> getRestaurantByCodePointeuse(
      String codePointeuse) async {
    final response = await http.get(
      Uri.parse(
          'https://qa.myrhis.fr/employee/restaurant/byCodePointeuse/$codePointeuse'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RestaurantModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }

  static Future<Map<String, dynamic>> getRestauratByCodePointeuse(
      String codePointeuse) async {
    final response = await http.get(
      Uri.parse(
          'https://qa.myrhis.fr/employee/restaurant/byCodePointeuse/$codePointeuse'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData as Map<String, dynamic>;
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }

  Future<RestaurantModel> confirmAssociation(String codePointeuse) async {
    final response = await http.get(
      Uri.parse(
          'https://qa.myrhis.fr/employee/restaurant/confirmassociation/$codePointeuse'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RestaurantModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }

  Future<RestaurantModel> linkMacPointeuseToRestaurant(
      String macPointeuse, String codePointeuse) async {
    final response = await http.get(
      Uri.parse(
          'https://qa.myrhis.fr/employee/restaurant/$macPointeuse/link/$codePointeuse'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RestaurantModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }

  Future<RestaurantModel> deletePointeuseRestaurantAssociation(
      String codePointeuse) async {
    final response = await http.get(
      Uri.parse(
          'https://qa.myrhis.fr/employee/restaurant/initialize/$codePointeuse'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RestaurantModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }

  Future<RestaurantModel> isRestaurantAssocitedToAnotherPointeuse(
      String coderesto) async {
    final response = await http.get(
      Uri.parse(
          'https://qa.myrhis.fr/employee/restaurant/isAssoicieted/$coderesto'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RestaurantModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }

  Future<RestaurantModel> launchImportNCRFiles(int idRestaurant) async {
    final response = await http.get(
      Uri.parse(
          'https://qa.myrhis.fr/planing/restaurant/icaisse/interfaceCaisseNCR/$idRestaurant'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RestaurantModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }

  Future<RestaurantModel> getRestaurants(String email) async {
    final response = await http.get(
      Uri.parse('https://qa.myrhis.fr/security/user/listrestaurants/$email'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RestaurantModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }

  Future<RestaurantModel> getListDroit(String email) async {
    final response = await http.get(
      Uri.parse('https://qa.myrhis.fr/security/user/droitList/$email'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RestaurantModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }

  Future<RestaurantModel> getListDroitForUser(String email) async {
    final response = await http.get(
      Uri.parse('https://qa.myrhis.fr/security/droit/droitList/$email'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RestaurantModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }

  Future<RestaurantModel> changeStatusRestaurant(int idRestaurant) async {
    final response = await http.get(
      Uri.parse(
          'https://qa.myrhis.fr/employee/restaurant/associationRestaurant/$idRestaurant'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RestaurantModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }
}
