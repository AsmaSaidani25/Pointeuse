import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pointeuse/Model/decoupage.horaire.model.dart';
// Import your SessionService class
import 'dart:async';
import 'package:pointeuse/Services/path.service.dart';
import 'GenericCRUDRestService.dart';
import 'Session.service.dart';
import 'authentification.service.dart'; // Import 'dart:async' for Observable

class DecoupageHoraireService
    extends GenericCRUDRestService<DecoupageHoraireModel, int> {
  DecoupageHoraireService(PathService pathService, http.Client httpClient,
      SessionService sessionService);

  Future<List<DecoupageHoraireModel>?> getDecoupageHoraire(
      int idRestaurant) async {
    final uuidRestaurant = SessionService.uuidGenerator(idRestaurant);
    final response = await http.get(Uri.parse(
        'https://qa.myrhis.fr/decoupage/horaire/pointeuse/$uuidRestaurant'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData
          .map((item) => DecoupageHoraireModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load decoupage horaire');
    }
  }
}
