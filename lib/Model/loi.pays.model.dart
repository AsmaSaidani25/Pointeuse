import 'contraintes.sociale.model.dart';
import 'enumeration/validationContrainteSociale.model.dart';

class LoiPaysModel extends ContraintesSocialesModel {
  late String valeurMajeurTempsPlein;
  late String valeurMineurTempsPlein;
  late String valeurMajeurTempsPartiel;
  late String valeurMineurTempsPartiel;
  late String valeurMajeurAfficher;
  late String valeurMineurAfficher;
  late String translatedLibelle;
  late bool mineurForbiddenChanges = false;
  late bool majeurForbiddenChanges = false;
  late bool loiPointeuse;
  ValidationContrainteSocialeModel? validationContrainteSociale;
  late bool isValid;
  late bool isTime;

  LoiPaysModel({
    valeurMajeurTempsPlein,
    valeurMineurTempsPlein,
    valeurMajeurTempsPartiel,
    valeurMineurTempsPartiel,
    valeurMajeurAfficher,
    valeurMineurAfficher,
    translatedLibelle,
    loiPointeuse,
    validationContrainteSociale,
    isValid,
    isTime,
    mineurForbiddenChanges,
    majeurForbiddenChanges,
  }) : super();
  factory LoiPaysModel.fromJson(Map<String, dynamic> map) {
    return LoiPaysModel(
      valeurMajeurTempsPlein: map['valeurMajeurTempsPlein'] ?? '',
      valeurMineurTempsPlein: map['valeurMineurTempsPlein'] ?? '',
      valeurMajeurTempsPartiel: map['valeurMajeurTempsPartiel'] ?? '',
      valeurMineurTempsPartiel: map['valeurMineurTempsPartiel'] ?? '',
      valeurMajeurAfficher: map['valeurMajeurAfficher'] ?? '',
      valeurMineurAfficher: map['valeurMineurAfficher'] ?? '',
      translatedLibelle: map['translatedLibelle'] ?? '',
      mineurForbiddenChanges: map['mineurForbiddenChanges'] ?? false,
      majeurForbiddenChanges: map['majeurForbiddenChanges'] ?? false,
      loiPointeuse: map['loiPointeuse'] ?? false,
      validationContrainteSociale: map['validationContrainteSociale'] != null
          ? ValidationContrainteSocialeModel.values.firstWhere(
              (e) => e.toString() == map['validationContrainteSociale'])
          : null,
      isValid: map['isValid'] ?? false,
      isTime: map['isTime'] ?? false,
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
