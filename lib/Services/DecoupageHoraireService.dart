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
  static Future<List<DecoupageHoraireModel>> getDecoupageHoraire(
      String idRestaurant) async {
    final url =
        'https://qa.myrhis.fr/planning/decoupage/horaire/pointeuse/$idRestaurant';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization':
            'Bearer_RH_IS eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpc21haWwubWFuc291cmlAcmhpcy1zb2x1dGlvbnMuY29tIiwiYXVkIjoiNDMyMCIsImlzcyI6ImV5SmhiR2NpT2lKSVV6STFOaUo5LmV5SnpkV0lpT2lKU1JVWlNSVk5JWDFSUFMwVk9JaXdpYVhOeklqb2lhWE50WVdsc0xtMWhibk52ZFhKcFFISm9hWE10YzI5c2RYUnBiMjV6TG1OdmJTSXNJbVY0Y0NJNk1UWTVPRFUyTnpnMk4zMC5qZWhTdDVfZ1FMN3g5X2dWV3hGamRWUU9EdTNtY1lOTkVpcllPWWduOHRNIiwiZXhwIjoxNjk4NTY3ODY3LCJhdXRob3JpdGllcyI6W119.ZEsz4Y917TGGfJZuMCKOU50fjEAzhB6OCwLqDJsBhqc',
        'Accept': 'application/json', // Set the Accept header
      },
    );

    // Log the entire response for inspection
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData
            .map((item) => DecoupageHoraireModel.fromJson(item))
            .toList();
      } catch (e) {
        // Handle the JSON parsing error
        print('JSON parsing error: $e');
        // Handle the error in an appropriate way, e.g., return an empty list or show an error message.
        throw Exception('Failed to parse decoupage horaire');
      }
    } else {
      // Handle non-200 status codes
      print(
          'Failed to load decoupage horaire. Status code: ${response.statusCode}');
      // Handle the error in an appropriate way, e.g., throw an exception or show an error message.
      throw Exception('Failed to load decoupage horaire');
    }
  }
}
