import 'package:http/http.dart' as http;
import 'package:pointeuse/Model/pagination.model.dart';

class GenericCRUDSqliteService<T, G> {
  late final http.Client httpClient;
  late final String baseUrl;

  Future<void> add(T entity, {required String apiUrl}) async {
    final response =
        await http.post(Uri.parse(baseUrl + (apiUrl ?? '/')), body: entity);
    if (response.statusCode == 200) {
      print('Entity added successfully');
    } else {
      print('Failed to add entity');
    }
  }

  Future<T?> update(T entity, {required String apiUrl}) async {
    final response =
        await http.put(Uri.parse(baseUrl + (apiUrl ?? '/')), body: entity);
    if (response.statusCode == 200) {
      print('Entity updated successfully');
      // Parse response.body if needed
    } else {
      print('Failed to update entity');
    }
  }

  Future<void> remove(G id, {required String apiUrl}) async {
    final response =
        await http.delete(Uri.parse(baseUrl + (apiUrl ?? '/') + id.toString()));
    if (response.statusCode == 200) {
      print('Entity removed successfully');
    } else {
      print('Failed to remove entity');
    }
  }

  Future<T?> getOneById(G id, {String? apiUrl}) async {
    final response =
        await http.get(Uri.parse(baseUrl + (apiUrl ?? '/') + id.toString()));
    if (response.statusCode == 200) {
      print('Entity retrieved successfully');
      // Parse response.body if needed
      // Return the parsed entity or null
      return null; // Replace with the actual parsed entity
    } else {
      print('Failed to retrieve entity');
      return null;
    }
  }

  Future<List<T>> getAll({String? apiUrl}) async {
    final response = await http.get(Uri.parse(baseUrl + (apiUrl ?? '/')));
    if (response.statusCode == 200) {
      print('Entities retrieved successfully');
      // Parse response.body if needed
      // Return the parsed list or an empty list
      return []; // Replace with the actual parsed list
    } else {
      print('Failed to retrieve entities');
      return []; // Return an empty list in case of failure
    }
  }

  Future<List<T>> getAllWithPaginationAndFilter(PaginationArgs paginationArgs,
      {required String apiUrl, required Map<String, dynamic> filter}) async {
    final url = Uri.parse(baseUrl +
        apiUrl +
        '?page=${paginationArgs.pageNumber}&size=${paginationArgs.pageSize}${generateUrl(filter)}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print('Entities retrieved with pagination and filter');
      // Parse response.body if needed
      // Return the parsed list or an empty list
      return []; // Replace with the actual parsed list
    } else {
      print('Failed to retrieve entities with pagination and filter');
      return []; // Return an empty list in case of failure
    }
  }

  String generateUrl(Map<String, dynamic> obj) {
    if (obj == null || obj.isEmpty) {
      return '';
    }
    final queryParams = obj.entries.map((entry) {
      return '${entry.key}=${entry.value}';
    }).join('&');
    return '&$queryParams';
  }
}
// Other methods...
