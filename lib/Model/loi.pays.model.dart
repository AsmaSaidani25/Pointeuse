import 'contraintes.sociale.model.dart';
import 'enumeration/validationContrainteSociale.model.dart';

class LoiPaysModel extends ContraintesSocialesModel {
  String? valeurMajeurTempsPlein;
  String? valeurMineurTempsPlein;
  String? valeurMajeurTempsPartiel;
  String? valeurMineurTempsPartiel;
  String? valeurMajeurAfficher;
  String? valeurMineurAfficher;
  String? translatedLibelle;
  bool mineurForbiddenChanges = false;
  bool majeurForbiddenChanges = false;
  bool? loiPointeuse;
  ValidationContrainteSocialeModel? validationContrainteSociale;
  bool? isValid;
  bool? isTime;

  LoiPaysModel({
    this.valeurMajeurTempsPlein,
    this.valeurMineurTempsPlein,
    this.valeurMajeurTempsPartiel,
    this.valeurMineurTempsPartiel,
    this.valeurMajeurAfficher,
    this.valeurMineurAfficher,
    this.translatedLibelle,
    this.loiPointeuse,
    this.validationContrainteSociale,
    this.isValid,
    this.isTime,
    mineurForbiddenChanges,
    majeurForbiddenChanges,
  }) : super();
  factory LoiPaysModel.fromJson(Map<String, dynamic> map) {
    return LoiPaysModel(
      valeurMajeurTempsPlein: map['valeurMajeurTempsPlein'],
      valeurMineurTempsPlein: map['valeurMineurTempsPlein'],
      valeurMajeurTempsPartiel: map['valeurMajeurTempsPartiel'],
      valeurMineurTempsPartiel: map['valeurMineurTempsPartiel'],
      valeurMajeurAfficher: map['valeurMajeurAfficher'],
      valeurMineurAfficher: map['valeurMineurAfficher'],
      translatedLibelle: map['translatedLibelle'],
      mineurForbiddenChanges: map['mineurForbiddenChanges'],
      majeurForbiddenChanges: map['majeurForbiddenChanges'],
      loiPointeuse: map['loiPointeuse'],
      validationContrainteSociale: map['validationContrainteSociale'] != null
          ? ValidationContrainteSocialeModel.values.firstWhere(
              (e) => e.toString() == map['validationContrainteSociale'])
          : null,
      isValid: map['isValid'],
      isTime: map['isTime'],
    );
  }
  factory LoiPaysModel.fromMap(Map<String, dynamic> map) {
    return LoiPaysModel(
      valeurMajeurTempsPlein: map['valeurMajeurTempsPlein'],
      valeurMineurTempsPlein: map['valeurMineurTempsPlein'],
      valeurMajeurTempsPartiel: map['valeurMajeurTempsPartiel'],
      valeurMineurTempsPartiel: map['valeurMineurTempsPartiel'],
      valeurMajeurAfficher: map['valeurMajeurAfficher'],
      valeurMineurAfficher: map['valeurMineurAfficher'],
      translatedLibelle: map['translatedLibelle'],
      loiPointeuse: map['loiPointeuse'],
      validationContrainteSociale: map['validationContrainteSociale'] != null
          ? getValidationContrainteSocialeModelFromString(
              'validationContrainteSociale')
          : null,
      isValid: map['isValid'],
      isTime: map['isTime'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'valeurMajeurTempsPlein': valeurMajeurTempsPlein,
      'valeurMineurTempsPlein': valeurMineurTempsPlein,
      'valeurMajeurTempsPartiel': valeurMajeurTempsPartiel,
      'valeurMineurTempsPartiel': valeurMineurTempsPartiel,
      'valeurMajeurAfficher': valeurMajeurAfficher,
      'valeurMineurAfficher': valeurMineurAfficher,
      'translatedLibelle': translatedLibelle,
      'loiPointeuse': loiPointeuse,
      'validationContrainteSociale': validationContrainteSociale?.toString(),
      'isValid': isValid,
      'isTime': isTime,
    };
  }
}
