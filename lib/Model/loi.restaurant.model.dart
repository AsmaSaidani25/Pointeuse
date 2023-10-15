import 'package:pointeuse/Model/contraintes.sociale.model.dart';

import 'loi.pays.model.dart';

class LoiRestaurantModel extends ContraintesSocialesModel {
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
  LoiPaysModel? loiRef;
  bool? toolTipShowMajeur;
  bool? toolTipShowMineur;

  //LoiRestaurantModel() : super();
}
