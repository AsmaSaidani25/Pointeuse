import 'contraintes.sociale.model.dart';
import 'employee.model.dart';

class LoiEmployeeModel extends ContraintesSocialesModel {
  String valeurMajeurTempsPlein;
  String valeurMineurTempsPlein;
  String valeurMajeurTempsPartiel;
  String valeurMineurTempsPartiel;
  bool isTime = false;
  bool isValid = true;
  bool isPeriod = false;
  bool majeurBooleanValue;
  bool mineurBooleanValue;
  String translatedLibelle;
  String valeurMajeurAfficher;
  String valeurMineurAfficher;
  dynamic loiRef;
  bool toolTipShowMajeur;
  bool toolTipShowMineur;
  EmployeeModel? employee;

  LoiEmployeeModel({
    required this.valeurMajeurTempsPlein,
    required this.valeurMineurTempsPlein,
    required this.valeurMajeurTempsPartiel,
    required this.valeurMineurTempsPartiel,
    required this.majeurBooleanValue,
    required this.mineurBooleanValue,
    required this.translatedLibelle,
    required this.valeurMajeurAfficher,
    required this.valeurMineurAfficher,
    this.loiRef,
    required this.toolTipShowMajeur,
    required this.toolTipShowMineur,
    this.employee,
    isTime,
    isValid,
    isPeriod,
  }) : super();

  factory LoiEmployeeModel.fromMap(Map<String, dynamic> map) {
    return LoiEmployeeModel(
      valeurMajeurTempsPlein: map['valeurMajeurTempsPlein'],
      valeurMineurTempsPlein: map['valeurMineurTempsPlein'],
      valeurMajeurTempsPartiel: map['valeurMajeurTempsPartiel'],
      valeurMineurTempsPartiel: map['valeurMineurTempsPartiel'],
      majeurBooleanValue: map['majeurBooleanValue'],
      mineurBooleanValue: map['mineurBooleanValue'],
      translatedLibelle: map['translatedLibelle'],
      valeurMajeurAfficher: map['valeurMajeurAfficher'],
      valeurMineurAfficher: map['valeurMineurAfficher'],
      loiRef: map['loiRef'],
      toolTipShowMajeur: map['toolTipShowMajeur'],
      toolTipShowMineur: map['toolTipShowMineur'],
      employee: map['employee'] != null
          ? EmployeeModel.fromMap(map['employee'])
          : null,
    );
  }

  factory LoiEmployeeModel.fromJson(Map<String, dynamic> map) {
    return LoiEmployeeModel(
      valeurMajeurTempsPlein: map['valeurMajeurTempsPlein'] ?? '',
      valeurMineurTempsPlein: map['valeurMineurTempsPlein'] ?? '',
      valeurMajeurTempsPartiel: map['valeurMajeurTempsPartiel'] ?? '',
      valeurMineurTempsPartiel: map['valeurMineurTempsPartiel'] ?? '',
      isTime: map['isTime'] ?? false,
      isValid: map['isValid'] ?? false,
      isPeriod: map['isPeriod'] ?? false,
      majeurBooleanValue: map['majeurBooleanValue'] ?? false,
      mineurBooleanValue: map['mineurBooleanValue'] ?? false,
      translatedLibelle: map['translatedLibelle'] ?? '',
      valeurMajeurAfficher: map['valeurMajeurAfficher'] ?? '',
      valeurMineurAfficher: map['valeurMineurAfficher'] ?? '',
      loiRef: map['loiRef'] ?? '',
      toolTipShowMajeur: map['toolTipShowMajeur'] ?? false,
      toolTipShowMineur: map['toolTipShowMineur'] ?? false,
      employee: EmployeeModel.fromJson(map['employee'] ?? ''),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'valeurMajeurTempsPlein': valeurMajeurTempsPlein,
      'valeurMineurTempsPlein': valeurMineurTempsPlein,
      'valeurMajeurTempsPartiel': valeurMajeurTempsPartiel,
      'valeurMineurTempsPartiel': valeurMineurTempsPartiel,
      'majeurBooleanValue': majeurBooleanValue,
      'mineurBooleanValue': mineurBooleanValue,
      'translatedLibelle': translatedLibelle,
      'valeurMajeurAfficher': valeurMajeurAfficher,
      'valeurMineurAfficher': valeurMineurAfficher,
      'loiRef': loiRef,
      'toolTipShowMajeur': toolTipShowMajeur,
      'toolTipShowMineur': toolTipShowMineur,
      'employee': employee?.toMap(),
    };
  }
}
