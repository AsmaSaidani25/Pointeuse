import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pointeuse/Model/pointage.model.dart';
import 'package:pointeuse/Services/path.service.dart';
import 'GenericCRUDRestService.dart';
import 'Session.service.dart';

class PlanningService extends GenericCRUDRestService<PointageModel, String> {
  late final PathService pathService;
  late final SessionService sessionService;

  PlanningService(http.Client httpClient, String baseUrl);

  static Future<List<PointageModel>> getListPointageByIdRestaurant(
      int idRestaurant) async {
    final uuidRestaurant = SessionService.uuidGenerator(idRestaurant);
    final response = await http.get(
      Uri.parse('https://qa.myrhis.fr/gdh/pointage/$uuidRestaurant'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => PointageModel.fromMap(data)).toList();
    } else {
      // Handle the error, e.g., by throwing an exception or returning null
      throw Exception('Failed to get parameters: ${response.statusCode}');
    }
  }

  Future<PointageModel> updatePointage(PointageModel entity) async {
    final updatedEntity = await super.update(entity, '/update');

    // Use updatedEntity as the updated PointageModel
    return updatedEntity;
  }
}
