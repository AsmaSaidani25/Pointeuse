import 'package:pointeuse/Model/enumeration/NameOfTable.enum.dart';
import 'package:pointeuse/Model/message.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dbJsStore.service.dart';

class MessageJsStoreService extends DbJsStoreService<MessageModel> {
  final tableName = NameOfTable.MESSAGE;

  Future<List<MessageModel>> getMessages() async {
    final maps = await super.getAll(tableName);
    final messages = maps.map((map) => MessageModel.fromMap(map)).toList();
    return messages;
  }

  Future<void> addMessage(MessageModel message) async {
    await super.add(tableName, message.toMap());
  }

  Future<void> deleteMessage(String idFront) async {
    await super.delete(tableName, idFront);
  }

  Future<void> updateMessage(MessageModel message) async {
    final idFront = message.idFront;
    if (idFront != null) {
      await super.update(tableName, idFront, message.toMap());
    } else {
      // Handle the case where idFront is null
      // For example, you might throw an exception or log an error
    }
  }

/*  Future<List<MessageModel>> getMessageByIdReciever(int idReciever) async {
    final messages = await connection.select<MessageModel>({
      'from': tableName,
      'where': {
        'idMessageReciever': idReciever,
        'isViewed': false,
      },
    });
    return messages;
  }*/
}
