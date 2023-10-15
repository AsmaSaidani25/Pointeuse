import 'contraintes.sociale.model.dart';

class LoiGroupeTravailModel extends ContraintesSocialesModel {
  String? valeurMajeurTempsPlein;
  String? valeurMineurTempsPlein;
  String? valeurMajeurTempsPartiel;
  String? valeurMineurTempsPartiel;
  bool isTime = false;
  bool isValid = true;
  bool isPeriod = false;
  bool? majeurBooleanValue;
  bool? mineurBooleanValue;
  String? translatedLibelle;
  String? valeurMajeurAfficher;
  String? valeurMineurAfficher;
  dynamic loiRef;
  bool? toolTipShowMajeur;
  bool? toolTipShowMineur;

  LoiGroupeTravailModel(
      {valeurMajeurTempsPlein,
      valeurMineurTempsPlein,
      valeurMajeurTempsPartiel,
      valeurMineurTempsPartiel,
      isTime,
      isValid,
      isPeriod,
      majeurBooleanValue,
      mineurBooleanValue,
      translatedLibelle,
      valeurMajeurAfficher,
      valeurMineurAfficher,
      loiRef,
      toolTipShowMajeur,
      toolTipShowMineur})
      : super();

  factory LoiGroupeTravailModel.fromJson(Map<String, dynamic> map) {
    return LoiGroupeTravailModel(
      valeurMajeurTempsPlein: map['valeurMajeurTempsPlein'],
      valeurMineurTempsPlein: map['valeurMineurTempsPlein'],
      valeurMajeurTempsPartiel: map['valeurMajeurTempsPartiel'],
      valeurMineurTempsPartiel: map['valeurMineurTempsPartiel'],
      isTime: map['isTime'] ?? false,
      isValid: map['isValid'] ?? true,
      isPeriod: map['isPeriod'] ?? false,
      majeurBooleanValue: map['majeurBooleanValue'],
      mineurBooleanValue: map['mineurBooleanValue'],
      translatedLibelle: map['translatedLibelle'],
      valeurMajeurAfficher: map['valeurMajeurAfficher'],
      valeurMineurAfficher: map['valeurMineurAfficher'],
      loiRef: map['loiRef'],
      toolTipShowMajeur: map['toolTipShowMajeur'],
      toolTipShowMineur: map['toolTipShowMineur'],
      // ... other property assignments ...
    );
  }
  factory LoiGroupeTravailModel.fromMap(Map<String, dynamic> map) {
    return LoiGroupeTravailModel()
      ..valeurMajeurTempsPlein = map['valeurMajeurTempsPlein']
      ..valeurMineurTempsPlein = map['valeurMineurTempsPlein']
      ..valeurMajeurTempsPartiel = map['valeurMajeurTempsPartiel']
      ..valeurMineurTempsPartiel = map['valeurMineurTempsPartiel']
      ..isTime = map['isTime']
      ..isValid = map['isValid']
      ..isPeriod = map['isPeriod']
      ..majeurBooleanValue = map['majeurBooleanValue']
      ..mineurBooleanValue = map['mineurBooleanValue']
      ..translatedLibelle = map['translatedLibelle']
      ..valeurMajeurAfficher = map['valeurMajeurAfficher']
      ..valeurMineurAfficher = map['valeurMineurAfficher']
      ..loiRef = map['loiRef']
      ..toolTipShowMajeur = map['toolTipShowMajeur']
      ..toolTipShowMineur = map['toolTipShowMineur'];
  }

  Map<String, dynamic> toMap() {
    return {
      'valeurMajeurTempsPlein': valeurMajeurTempsPlein,
      'valeurMineurTempsPlein': valeurMineurTempsPlein,
      'valeurMajeurTempsPartiel': valeurMajeurTempsPartiel,
      'valeurMineurTempsPartiel': valeurMineurTempsPartiel,
      'isTime': isTime,
      'isValid': isValid,
      'isPeriod': isPeriod,
      'majeurBooleanValue': majeurBooleanValue,
      'mineurBooleanValue': mineurBooleanValue,
      'translatedLibelle': translatedLibelle,
      'valeurMajeurAfficher': valeurMajeurAfficher,
      'valeurMineurAfficher': valeurMineurAfficher,
      'loiRef': loiRef,
      'toolTipShowMajeur': toolTipShowMajeur,
      'toolTipShowMineur': toolTipShowMineur,
    };
  }
}
