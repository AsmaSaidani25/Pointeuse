import 'dart:convert';

import 'package:http/http.dart' as http; // Make sure to import the http package
import 'package:pointeuse/Model/parametre.model.dart';
import 'package:pointeuse/Services/path.service.dart';
import 'GenericCRUDRestService.dart';
import 'Session.service.dart';
import 'authentification.service.dart';
import 'dateService.dart';

class ParametreService extends GenericCRUDRestService<ParametreModel, int> {
  ParametreService();

/*  ParametreService(http.Client httpClient, String baseUrl)
      : super(httpClient, baseUrl);*/

  static Future<List<ParametreModel>> getAllParametreByIdRestaurat(
      int idRestaurant) async {
    final uuidRestaurant = SessionService.uuidGenerator(idRestaurant);
    final response = await http.get(Uri.parse(
        'https://qa.myrhis.fr/employee/params/all/parametrePointeuse/' +
            uuidRestaurant));
    if (response.statusCode == 200) {
      // Successful response, parse and return the data
      final dynamic jsonData = json.decode(response.body);
      return jsonData;
    } else {
      // Handle the error, e.g., by throwing an exception or returning null
      throw Exception('Failed to get parameters: ${response.statusCode}');
    }
  }

  Future<List<ParametreModel>> updateParamsByRestaurant(
      List<ParametreModel> listeParametres, int idRestaurant) async {
    final uuidRestaurant = SessionService.uuidGenerator(idRestaurant);
    setStringFromDate(listeParametres);
    final response = await http.put(
        Uri.parse('https://qa.myrhis.fr/employee/params/forPointeuse/' +
            uuidRestaurant),
        body: jsonEncode(listeParametres),
        headers: {
          'Content-Type': 'application/json'
        }); // You might need to adjust headers and serialization
    if (response.statusCode == 200) {
      // Successful response, parse and return the updated data
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => ParametreModel.fromJson(item)).toList();
    } else {
      // Handle the error, e.g., by throwing an exception or returning an empty list
      throw Exception('Failed to update parameters: ${response.statusCode}');
    }
  }

  void setStringFromDate(List<ParametreModel> listeParametres) {
    for (var item in listeParametres) {
      if (item.valeur is DateTime) {
        item.valeur = DateService.setStringFromDate(item.valeur);
      }
    }
  }
}
