import 'type.pointage.model.dart';

class CorrectionPointageModel {
  int? idCorrectionPointagePointeuse;
  String? pointageIdFront;
  String? idFront;
  int? idEmployee;
  int? idManager;
  dynamic dayOfActivity;
  String? entityAction;
  String? pointageTime;
  dynamic newValue;
  bool? newValueIsNight;
  dynamic oldValue;
  bool? oldValueIsNight;
  dynamic dateModification;
  String? nomEmployee;
  String? prenomEmployee;
  String? employeeCodeBadge;
  String? nomManager;
  String? prenomManager;
  TypePointageModel? oldTypePointage;
  TypePointageModel? newTypePointage;
  int? idRestaurant;

  CorrectionPointageModel({
    this.idCorrectionPointagePointeuse,
    this.pointageIdFront,
    this.idFront,
    this.idEmployee,
    this.idManager,
    this.dayOfActivity,
    this.entityAction,
    this.pointageTime,
    this.newValue,
    this.newValueIsNight,
    this.oldValue,
    this.oldValueIsNight,
    this.dateModification,
    this.nomEmployee,
    this.prenomEmployee,
    this.employeeCodeBadge,
    this.nomManager,
    this.prenomManager,
    this.oldTypePointage,
    this.newTypePointage,
    this.idRestaurant,
  });

  // Add a factory constructor for creating from a Map
  factory CorrectionPointageModel.fromMap(Map<String, dynamic> map) {
    return CorrectionPointageModel(
      idCorrectionPointagePointeuse: map['idCorrectionPointagePointeuse'],
      pointageIdFront: map['pointageIdFront'],
      idFront: map['idFront'],
      idEmployee: map['idEmployee'],
      idManager: map['idManager'],
      dayOfActivity: map['dayOfActivity'],
      entityAction: map['entityAction'],
      pointageTime: map['pointageTime'],
      newValue: map['newValue'],
      newValueIsNight: map['newValueIsNight'],
      oldValue: map['oldValue'],
      oldValueIsNight: map['oldValueIsNight'],
      dateModification: map['dateModification'],
      nomEmployee: map['nomEmployee'],
      prenomEmployee: map['prenomEmployee'],
      employeeCodeBadge: map['employeeCodeBadge'],
      nomManager: map['nomManager'],
      prenomManager: map['prenomManager'],
      oldTypePointage: TypePointageModel.fromMap(map['oldTypePointage']),
      newTypePointage: TypePointageModel.fromMap(map['newTypePointage']),
      idRestaurant: map['idRestaurant'],
    );
  }
// Add a method to convert the instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'idCorrectionPointagePointeuse': idCorrectionPointagePointeuse,
      'pointageIdFront': pointageIdFront,
      'idFront': idFront,
      'idEmployee': idEmployee,
      'idManager': idManager,
      'dayOfActivity': dayOfActivity,
      'entityAction': entityAction,
      'pointageTime': pointageTime,
      'newValue': newValue,
      'newValueIsNight': newValueIsNight,
      'oldValue': oldValue,
      'oldValueIsNight': oldValueIsNight,
      'dateModification': dateModification,
      'nomEmployee': nomEmployee,
      'prenomEmployee': prenomEmployee,
      'employeeCodeBadge': employeeCodeBadge,
      'nomManager': nomManager,
      'prenomManager': prenomManager,
      'oldTypePointage': oldTypePointage
          ?.toMap(), // Assuming TypePointageModel has a toMap method
      'newTypePointage': newTypePointage
          ?.toMap(), // Assuming TypePointageModel has a toMap method
      'idRestaurant': idRestaurant,
    };
  }
}
