import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pointeuse/Model/message.model.dart';
import 'package:pointeuse/Services/path.service.dart';

import 'GenericCRUDRestService.dart';
import 'Session.service.dart';
import 'authentification.service.dart';

class MessageService extends GenericCRUDRestService<MessageModel, String> {
  final String baseUrl;

  MessageService(http.Client httpClient, PathService pathService,
      SessionService sessionService)
      : baseUrl = '${pathService.getPathEmployee()}/message';

  Future<List<MessageModel>> getMessagesByRestaurant(int idRestaurant) async {
    final uuidRestaurant = SessionService.idRestaurant;
    final response = await http
        .get(Uri.parse('https://qa.myrhis.fr/byRestaurant/$uuidRestaurant'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => MessageModel.fromMap(data)).toList();
    } else {
      throw Exception('Failed to retrieve messages');
    }
  }

  Future<void> saveAllMessages(List<MessageModel> messages) async {
    final response =
        await http.post(Uri.parse(baseUrl), body: json.encode(messages));

    if (response.statusCode != 200) {
      throw Exception('Failed to save messages');
    }
  }
}
