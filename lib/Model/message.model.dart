import 'enumeration/TypeMessage.enum.dart';

class MessageModel {
  String? idFront;
  int? idMessage;
  String? contenuMessage;
  // Blob? messageAudio;
  DateTime? dateCreation;
  TypeMessage? typeMessage;
  bool? isViewed;
  int? idMessageOwner;
  String? fullNameMessageOwner;
  int? idMessageReciever;

  Map<String, dynamic> toMap() {
    return {
      'idFront': idFront,
      'idMessage': idMessage,
      'contenuMessage': contenuMessage,
      'dateCreation': dateCreation?.toIso8601String(),
      'typeMessage': typeMessage?.toString(),
      'isViewed': isViewed,
      'idMessageOwner': idMessageOwner,
      'fullNameMessageOwner': fullNameMessageOwner,
      'idMessageReciever': idMessageReciever,
    };
  }

  MessageModel(
      {idFront,
      idMessage,
      contenuMessage,
      DateTime? dateCreation,
      typeMessage,
      isViewed,
      idMessageOwner,
      fullNameMessageOwner,
      idMessageReciever});
  // You can also add a constructor to create a MessageModel instance from a map
  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      idFront: map['idFront'],
      idMessage: map['idMessage'],
      contenuMessage: map['contenuMessage'],
      dateCreation: DateTime.tryParse(map['dateCreation']),
      typeMessage: map['typeMessage'],
      isViewed: map['isViewed'],
      idMessageOwner: map['idMessageOwner'],
      fullNameMessageOwner: map['fullNameMessageOwner'],
      idMessageReciever: map['idMessageReciever'],
    );
  }
}
