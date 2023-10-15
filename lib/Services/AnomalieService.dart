import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pointeuse/Model/anomalie.model.dart';
import 'package:pointeuse/Services/path.service.dart';
import 'GenericCRUDRestService.dart';
import 'Session.service.dart';
import 'authentification.service.dart';
import 'dart:async'; // Import 'dart:async' for Observable

class AnomalieService extends GenericCRUDRestService<AnomalieModel, String> {
  final List<int> ListIdEmployees;

  AnomalieService(PathService pathService, http.Client httpClient,
      SessionService sessionService)
      : ListIdEmployees = <int>[];

  Future<List<AnomalieModel>?> getAllAnomalieByRestaurant(
      int idRestaurant) async {
    final uuidRestaurant = SessionService.idRestaurant;
    final response = await http.get(Uri.parse('/pointeuse/$uuidRestaurant'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => AnomalieModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load all anomalies by restaurant');
    }
  }

  Future<AnomalieModel> updatePointage(AnomalieModel entity) async {
    final updatedEntity = await super.update(entity, '/update');

    return updatedEntity;
  }
}
