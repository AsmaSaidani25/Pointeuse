import 'employee.model.dart';
import 'gui/date-intervale.dart';

class ShiftModel {
  dynamic idShift;
  String? idFront;
  dynamic heureDebut;
  bool? heureDebutIsNight;
  dynamic heureFin;
  bool? heureFinIsNight;
  dynamic dateJournee;
  dynamic totalHeure;
  dynamic nombreEmployeeRequis;
  dynamic shiftPrincipale;
  dynamic heureDebutModifier;
  bool? heureDebutModifierIsNight;
  dynamic heureFinModifier;
  bool? heureFinModifierIsNight;
  EmployeeModel? employee;
  dynamic idPlanning;
  dynamic idRestaurant;
  bool sign = false;
  dynamic heureDebutCheval;
  dynamic heureFinCheval;
  bool? heureDebutChevalIsNight;
  bool? heureFinChevalIsNight;
  dynamic acheval;
  dynamic modifiable;
  DateInterval dateInterval;

  String toStringa() {
    return 'ShiftModel {\n'
        'idShift: $idShift,\n'
        'idFront: $idFront,\n'
        'heureDebut: $heureDebut,\n'
        'heureDebutIsNight: $heureDebutIsNight,\n'
        'heureFin: $heureFin,\n'
        'heureFinIsNight: $heureFinIsNight,\n'
        'dateJournee: $dateJournee,\n'
        'totalHeure: $totalHeure,\n'
        'nombreEmployeeRequis: $nombreEmployeeRequis,\n'
        'shiftPrincipale: $shiftPrincipale,\n'
        'heureDebutModifier: $heureDebutModifier,\n'
        'heureDebutModifierIsNight: $heureDebutModifierIsNight,\n'
        'heureFinModifier: $heureFinModifier,\n'
        'heureFinModifierIsNight: $heureFinModifierIsNight,\n'
        'employee: $employee,\n'
        'idPlanning: $idPlanning,\n'
        'idRestaurant: $idRestaurant,\n'
        'sign: $sign,\n'
        'heureDebutCheval: $heureDebutCheval,\n'
        'heureFinCheval: $heureFinCheval,\n'
        'heureDebutChevalIsNight: $heureDebutChevalIsNight,\n'
        'heureFinChevalIsNight: $heureFinChevalIsNight,\n'
        'acheval: $acheval,\n'
        'modifiable: $modifiable\n'
        '}';
  }

  // Method to convert ShiftModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'idShift': idShift,
      'idFront': idFront,
      'heureDebut': heureDebut,
      'heureDebutIsNight': heureDebutIsNight,
      'heureFin': heureFin,
      'heureFinIsNight': heureFinIsNight,
      'dateJournee': dateJournee,
      'totalHeure': totalHeure,
      'nombreEmployeeRequis': nombreEmployeeRequis,
      'shiftPrincipale': shiftPrincipale,
      'heureDebutModifier': heureDebutModifier,
      'heureDebutModifierIsNight': heureDebutModifierIsNight,
      'heureFinModifier': heureFinModifier,
      'heureFinModifierIsNight': heureFinModifierIsNight,
      'employee': employee,
      'idPlanning': idPlanning,
      'idRestaurant': idRestaurant,
      'sign': sign,
      'heureDebutCheval': heureDebutCheval,
      'heureFinCheval': heureFinCheval,
      'heureDebutChevalIsNight': heureDebutChevalIsNight,
      'heureFinChevalIsNight': heureFinChevalIsNight,
      'acheval': acheval,
      'modifiable': modifiable
    };
  }

  factory ShiftModel.fromMap(Map<String, dynamic> map) {
    return ShiftModel(
      idShift: map['idShift'],
      idFront: map['idFront'],
      heureDebut: map['heureDebut'],
      heureDebutIsNight: map['heureDebutIsNight'],
      heureFin: map['heureFin'],
      heureFinIsNight: map['heureFinIsNight'],
      dateJournee: map['dateJournee'],
      totalHeure: map['totalHeure'],
      nombreEmployeeRequis: map['nombreEmployeeRequis'],
      shiftPrincipale: map['shiftPrincipale'],
      heureDebutModifier: map['heureDebutModifier'],
      heureDebutModifierIsNight: map['heureDebutModifierIsNight'],
      heureFinModifier: map['heureFinModifier'],
      heureFinModifierIsNight: map['heureFinModifierIsNight'],
      employee: EmployeeModel.fromMap(map['employee']),
      idPlanning: map['idPlanning'],
      idRestaurant: map['idRestaurant'],
      // sign: map['sign'] ?? false,
      heureDebutCheval: map['heureDebutCheval'],
      heureFinCheval: map['heureFinCheval'],
      heureDebutChevalIsNight: map['heureDebutChevalIsNight'],
      heureFinChevalIsNight: map['heureFinChevalIsNight'],
      acheval: map['acheval'],
      modifiable: map['modifiable'], dateInterval: map['dateInterval'],
    );
  }
  ShiftModel({
    this.idShift,
    this.idFront,
    this.heureDebut,
    this.heureDebutIsNight,
    this.heureFin,
    this.heureFinIsNight,
    this.dateJournee,
    this.totalHeure,
    this.nombreEmployeeRequis,
    this.shiftPrincipale,
    this.heureDebutModifier,
    this.heureDebutModifierIsNight,
    this.heureFinModifier,
    this.heureFinModifierIsNight,
    this.employee,
    this.idPlanning,
    this.idRestaurant,
    this.heureDebutCheval,
    this.heureFinCheval,
    this.heureDebutChevalIsNight,
    this.heureFinChevalIsNight,
    this.acheval,
    this.modifiable,
    required this.dateInterval,
    sign,
  });
  factory ShiftModel.fromJson(Map<String, dynamic> json) {
    return ShiftModel(
      idShift: json['idShift'],
      idFront: json['idFront'],
      heureDebut: json['heureDebut'],
      heureDebutIsNight: json['heureDebutIsNight'],
      heureFin: json['heureFin'],
      heureFinIsNight: json['heureFinIsNight'],
      dateJournee: json['dateJournee'],
      totalHeure: json['totalHeure'],
      nombreEmployeeRequis: json['nombreEmployeeRequis'],
      shiftPrincipale: json['shiftPrincipale'],
      heureDebutModifier: json['heureDebutModifier'],
      heureDebutModifierIsNight: json['heureDebutModifierIsNight'],
      heureFinModifier: json['heureFinModifier'],
      heureFinModifierIsNight: json['heureFinModifierIsNight'],
      employee: EmployeeModel.fromJson(
          json['employee']), // You might need to implement this
      idPlanning: json['idPlanning'],
      idRestaurant: json['idRestaurant'],
      sign: json['sign'] ?? false,
      heureDebutCheval: json['heureDebutCheval'],
      heureFinCheval: json['heureFinCheval'],
      heureDebutChevalIsNight: json['heureDebutChevalIsNight'],
      heureFinChevalIsNight: json['heureFinChevalIsNight'],
      acheval: json['acheval'],
      modifiable: json['modifiable'], dateInterval: json['dateInterval'],
    );
  }
}
