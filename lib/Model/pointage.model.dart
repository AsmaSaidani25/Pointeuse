import 'package:pointeuse/Model/type.pointage.model.dart';

class PointageModel {
  late int? idEmployee;
  late int? idShift;
  late String idFront;
  late dynamic dateJournee;
  late dynamic heureDebut;
  late bool heureDebutIsNight;
  late dynamic heureFin;
  late bool heureFinIsNight;
  late int tempsPointes;
  late TypePointageModel? typePointageRef;
  late int modified;
  late dynamic creationDate;
  late int? idRestaurant;
  late int voucherPrintState;
  late bool isAcheval;
  late dynamic heureDebutAcheval;
  late bool heureDebutAchevalIsNight;
  late int idTypePointageRef;

  // Constructor
  PointageModel(
      {this.idEmployee,
      this.idShift,
      idFront,
      this.dateJournee,
      this.heureDebut,
      heureDebutIsNight,
      this.heureFin,
      heureFinIsNight,
      tempsPointes,
      this.typePointageRef,
      modified,
      this.creationDate,
      this.idRestaurant,
      voucherPrintState,
      isAcheval,
      this.heureDebutAcheval,
      heureDebutAchevalIsNight,
      idTypePointageRef});

  // Convert Map to PointageModel
  factory PointageModel.fromMap(Map<String, dynamic> map) {
    return PointageModel(
      idEmployee: map['idEmployee'],
      idShift: map['idShift'],
      idFront: map['idFront'],
      dateJournee: map['dateJournee'],
      heureDebut: map['heureDebut'],
      heureDebutIsNight: map['heureDebutIsNight'],
      heureFin: map['heureFin'],
      heureFinIsNight: map['heureFinIsNight'],
      tempsPointes: map['tempsPointes'],
      typePointageRef: TypePointageModel.fromMap(map['typePointageRef']),
      modified: map['modified'],
      creationDate: map['creationDate'],
      idRestaurant: map['idRestaurant'],
      voucherPrintState: map['voucherPrintState'],
      isAcheval: map['isAcheval'],
      heureDebutAcheval: map['heureDebutAcheval'],
      heureDebutAchevalIsNight: map['heureDebutAchevalIsNight'],
      idTypePointageRef: map['idTypePointageRef'],
    );
  }

  factory PointageModel.fromJson(Map<String, dynamic> json) {
    return PointageModel(
      idEmployee: json['idEmployee'] ?? '',
      idShift: json['idShift'] ?? '',
      idFront: json['idFront'] ?? '',
      dateJournee: json['dateJournee'] ?? '',
      heureDebut: json['heureDebut'] ?? '',
      heureDebutIsNight: json['heureDebutIsNight'] ?? false,
      heureFin: json['heureFin'] ?? '',
      heureFinIsNight: json['heureFinIsNight'] ?? false,
      tempsPointes: json['tempsPointes'] ?? '',
      typePointageRef: json['typePointageRef'] ?? '',
      modified: json['modified'] ?? '',
      creationDate: json['creationDate'] ?? '',
      idRestaurant: json['idRestaurant'] ?? '',
      voucherPrintState: json['voucherPrintState'] ?? '',
      isAcheval: json['isAcheval'] ?? false,
      heureDebutAcheval: json['heureDebutAcheval'] ?? '',
      heureDebutAchevalIsNight: json['heureDebutAchevalIsNight'] ?? false,
      idTypePointageRef: json['idTypePointageRef'] ?? '',
    );
  }

  // Convert PointageModel to Map
  Map<String, dynamic> toMap() {
    return {
      'idEmployee': idEmployee,
      'idShift': idShift,
      'idFront': idFront,
      'dateJournee': dateJournee,
      'heureDebut': heureDebut,
      'heureDebutIsNight': heureDebutIsNight,
      'heureFin': heureFin,
      'heureFinIsNight': heureFinIsNight,
      'tempsPointes': tempsPointes,
      'typePointageRef': typePointageRef?.toMap(),
      'modified': modified,
      'creationDate': creationDate,
      'idRestaurant': idRestaurant,
      'voucherPrintState': voucherPrintState,
      'isAcheval': isAcheval,
      'heureDebutAcheval': heureDebutAcheval,
      'heureDebutAchevalIsNight': heureDebutAchevalIsNight,
    };
  }
}
