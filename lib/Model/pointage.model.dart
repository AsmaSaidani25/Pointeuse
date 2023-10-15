import 'package:pointeuse/Model/type.pointage.model.dart';

class PointageModel {
  int? idEmployee;
  int? idShift;
  String idFront;
  dynamic dateJournee;
  dynamic heureDebut;
  bool heureDebutIsNight;
  dynamic heureFin;
  bool heureFinIsNight;
  int? tempsPointes;
  TypePointageModel? typePointageRef;
  int? modified;
  dynamic creationDate;
  int? idRestaurant;
  int? voucherPrintState;
  bool? isAcheval;
  dynamic heureDebutAcheval;
  bool? heureDebutAchevalIsNight;
  int idTypePointageRef;

  // Constructor
  PointageModel(
      {this.idEmployee,
      this.idShift,
      required this.idFront,
      this.dateJournee,
      this.heureDebut,
      required this.heureDebutIsNight,
      this.heureFin,
      required this.heureFinIsNight,
      this.tempsPointes,
      this.typePointageRef,
      this.modified,
      this.creationDate,
      this.idRestaurant,
      this.voucherPrintState,
      this.isAcheval,
      this.heureDebutAcheval,
      this.heureDebutAchevalIsNight,
      required this.idTypePointageRef});

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
      idEmployee: json['idEmployee'],
      idShift: json['idShift'],
      idFront: json['idFront'],
      dateJournee: json['dateJournee'],
      heureDebut: json['heureDebut'],
      heureDebutIsNight: json['heureDebutIsNight'],
      heureFin: json['heureFin'],
      heureFinIsNight: json['heureFinIsNight'],
      tempsPointes: json['tempsPointes'],
      typePointageRef: json['typePointageRef'],
      modified: json['modified'],
      creationDate: json['creationDate'],
      idRestaurant: json['idRestaurant'],
      voucherPrintState: json['voucherPrintState'],
      isAcheval: json['isAcheval'],
      heureDebutAcheval: json['heureDebutAcheval'],
      heureDebutAchevalIsNight: json['heureDebutAchevalIsNight'],
      idTypePointageRef: json['idTypePointageRef'],
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
