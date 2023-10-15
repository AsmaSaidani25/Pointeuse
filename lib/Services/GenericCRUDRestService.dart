import 'package:http/http.dart' as http;
import 'dart:convert'; // For jsonEncode

class GenericCRUDRestService<T, K> {
  late final http.Client httpClient;
  late final String baseUrl;

  // GenericCRUDRestService(this.httpClient, this.baseUrl);
  Future<T> update<T>(T entity, [String? apiUrl]) async {
    final url = Uri.parse(baseUrl + (apiUrl ?? '/'));

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json', // Set the content type to JSON
      },
      body: jsonEncode(entity), // Encode the entity as JSON
    );

    if (response.statusCode == 200) {
      // Successful response, parse and return the updated entity
      final dynamic jsonData = json.decode(response.body);
      return jsonData as T;
    } else {
      // Handle the error, e.g., by throwing an exception or returning null
      throw Exception('Failed to update entity: ${response.statusCode}');
    }
  }
// Define the GenericCRUDRestService class based on your implementation.
}
