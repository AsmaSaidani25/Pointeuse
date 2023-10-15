import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pointeuse/Model/type.pointage.model.dart';
import 'package:pointeuse/Services/path.service.dart';

import 'GenericCRUDRestService.dart';
import 'authentification.service.dart';

class TypePointageService
    extends GenericCRUDRestService<TypePointageModel, int> {
  late final PathService pathService;
  late final http.Client httpClient;

  TypePointageService(http.Client httpClient, String baseUrl);

  static Future<List<TypePointageModel>> getActiveTypePointage() async {
    final response = await http.get(
      Uri.parse('https://qa.myrhis.fr/employee/pointeuse/active/all'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((json) => TypePointageModel.fromMap(json))
          .toList();
    } else {
      // Handle the error, e.g., by throwing an exception or returning null
      throw Exception('Failed to get parameters: ${response.statusCode}');
    }
  }
}
