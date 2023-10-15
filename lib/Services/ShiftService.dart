import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pointeuse/Model/shift.model.dart';
import 'GenericCRUDRestService.dart';
import 'authentification.service.dart';
import 'authentification.service.dart';
import 'dateService.dart';
import 'path.service.dart'; // Import your PathService class
import 'package:pointeuse/Model/shift.model.dart'; // Import your ShiftModel class
import 'Session.service.dart'; // Import your SessionService class
// Import your DateService class
import 'dart:async'; // Import 'dart:async' for Observable

class ShiftService extends GenericCRUDRestService<ShiftModel, String> {
  ShiftService(PathService pathService, http.Client httpClient,
      SessionService sessionService, DateService dateHelperService);

  Future<List<ShiftModel>?> getListShiftByIdRestaurant(int idRestaurant) async {
    final uuidRestaurant = SessionService.idRestaurant;
    final dateJournee = DateService.formatDateToScoreDelimiter(
        DateTime.parse(SessionService.getDateJournee()));
    final response = await http.get(Uri.parse(
        'https://qa.myrhis.fr/shiftInPointeuse/$uuidRestaurant/$dateJournee'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => ShiftModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load list of shifts');
    }
  }
}
