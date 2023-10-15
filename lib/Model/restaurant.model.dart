import 'package:pointeuse/Model/parametre.nationaux.model.dart';

import 'employee.model.dart';

class RestaurantModel {
  int? idRestaurant;
  String? idFront;
  String? libelle;
  String? matricule;
  String? adresse;
  String? codePostal;
  String? telephone;
  String? telephone2;
  String? codeDebutMatricule;
  String? numTVA;
  String? siret;
  String? codeAPE;
  String? numURSSAF;
  String? centreURSSAF;
  String? pointRassemblement;
  dynamic typeRestaurant;
  bool? defaultRestaurant;
  bool? associationPointeuse;
  EmployeeModel? directeur;
  String? codePointeuse;
  String? macPointeuse;
  String? uuid;
  dynamic pays;
  ParametreNationauxModel? parametreNationaux;
  dynamic societe;
  dynamic periodeRestaurant;
  int? valeurDebutMois;
  bool? arrondiContratSup;
  dynamic typeEvenements;
  dynamic jourFeriesRefs;

  RestaurantModel(
      {idRestaurant,
      idFront,
      parametreNationaux,
      societe,
      periodeRestaurant,
      valeurDebutMois,
      arrondiContratSup,
      typeEvenements,
      jourFeriesRefs,
      uuid,
      pays,
      macPointeuse,
      codePointeuse,
      directeur,
      associationPointeuse,
      libelle,
      adresse,
      codePostal,
      telephone,
      matricule,
      codeDebutMatricule,
      telephone2,
      numTVA,
      siret,
      codeAPE,
      centreURSSAF,
      pointRassemblement,
      numURSSAF,
      typeRestaurant,
      defaultRestaurant}) {
    defaultRestaurant = false;
    valeurDebutMois = 1;
  }
  Map<String, dynamic> toJson() {
    return {
      'idRestaurant': idRestaurant,
      'idFront': idFront,
      'libelle': libelle,
      'matricule': matricule,
      'adresse': adresse,
      'codePostal': codePostal,
      'telephone': telephone,
      'telephone2': telephone2,
      'codeDebutMatricule': codeDebutMatricule,
      'numTVA': numTVA,
      'siret': siret,
      'codeAPE': codeAPE,
      'numURSSAF': numURSSAF,
      'centreURSSAF': centreURSSAF,
      'pointRassemblement': pointRassemblement,
      'typeRestaurant': typeRestaurant,
      'defaultRestaurant': defaultRestaurant,
      'associationPointeuse': associationPointeuse,
      'directeur': directeur?.toJson(),
      // Convert EmployeeModel to Map
      'codePointeuse': codePointeuse,
      'macPointeuse': macPointeuse,
      'uuid': uuid,
      'pays': pays,
      'parametreNationaux': parametreNationaux?.toJson(),
      // Convert ParametreNationauxModel to Map
      'societe': societe,
      'periodeRestaurant': periodeRestaurant,
      'valeurDebutMois': valeurDebutMois,
      'arrondiContratSup': arrondiContratSup,
      'typeEvenements': typeEvenements,
      'jourFeriesRefs': jourFeriesRefs,
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel()
      ..idRestaurant = map['idRestaurant']
      ..idFront = map['idFront']
      ..libelle = map['libelle']
      ..matricule = map['matricule']
      ..adresse = map['adresse']
      ..codePostal = map['codePostal']
      ..telephone = map['telephone']
      ..telephone2 = map['telephone2']
      ..codeDebutMatricule = map['codeDebutMatricule']
      ..numTVA = map['numTVA']
      ..siret = map['siret']
      ..codeAPE = map['codeAPE']
      ..numURSSAF = map['numURSSAF']
      ..centreURSSAF = map['centreURSSAF']
      ..pointRassemblement = map['pointRassemblement']
      ..typeRestaurant = map['typeRestaurant']
      ..defaultRestaurant = map['defaultRestaurant']
      ..associationPointeuse = map['AssociationPointeuse']
      ..directeur = EmployeeModel.fromMap(map['directeur'])
      ..codePointeuse = map['codePointeuse']
      ..macPointeuse = map['macPointeuse']
      ..uuid = map['uuid']
      ..pays = map['pays']
      ..parametreNationaux =
          ParametreNationauxModel.fromMap(map['parametreNationaux'])
      ..societe = map['societe']
      ..periodeRestaurant = map['periodeRestaurant']
      ..valeurDebutMois = map['valeurDebutMois']
      ..arrondiContratSup = map['arrondiContratSup']
      ..typeEvenements = map['typeEvenements']
      ..jourFeriesRefs = map['jourFeriesRefs'];
  }
  factory RestaurantModel.fromJson(Map<String, dynamic> map) {
    return RestaurantModel(
      idRestaurant: map['idRestaurant'],
      idFront: map['idFront'],
      libelle: map['libelle'],
      matricule: map['matricule'],
      adresse: map['adresse'],
      codePostal: map['codePostal'],
      telephone: map['telephone'],
      telephone2: map['telephone2'],
      codeDebutMatricule: map['codeDebutMatricule'],
      numTVA: map['numTVA'],
      siret: map['siret'],
      codeAPE: map['codeAPE'],
      numURSSAF: map['numURSSAF'],
      centreURSSAF: map['centreURSSAF'],
      pointRassemblement: map['pointRassemblement'],
      typeRestaurant: map['typeRestaurant'],
      defaultRestaurant: map['defaultRestaurant'],
      associationPointeuse: map['associationPointeuse'],
      directeur: EmployeeModel.fromJson(
          map['directeur']), // You'll need to implement EmployeeModel.fromJson
      codePointeuse: map['codePointeuse'],
      macPointeuse: map['macPointeuse'],
      uuid: map['uuid'],
      pays: map['pays'],
      parametreNationaux: ParametreNationauxModel.fromJson(map[
          'parametreNationaux']), // You'll need to implement ParametreNationauxModel.fromJson
      societe: map['societe'],
      periodeRestaurant: map['periodeRestaurant'],
      valeurDebutMois: map['valeurDebutMois'],
      arrondiContratSup: map['arrondiContratSup'],
      typeEvenements: map['typeEvenements'],
      jourFeriesRefs: map['jourFeriesRefs'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'idRestaurant': idRestaurant,
      'idFront': idFront,
      'libelle': libelle,
      'matricule': matricule,
      'adresse': adresse,
      'codePostal': codePostal,
      'telephone': telephone,
      'telephone2': telephone2,
      'codeDebutMatricule': codeDebutMatricule,
      'numTVA': numTVA,
      'siret': siret,
      'codeAPE': codeAPE,
      'numURSSAF': numURSSAF,
      'centreURSSAF': centreURSSAF,
      'pointRassemblement': pointRassemblement,
      'typeRestaurant': typeRestaurant,
      'defaultRestaurant': defaultRestaurant,
      'AssociationPointeuse': associationPointeuse,
      'directeur': directeur?.toMap(),
      'codePointeuse': codePointeuse,
      'macPointeuse': macPointeuse,
      'uuid': uuid,
      'pays': pays,
      'parametreNationaux': parametreNationaux?.toMap(),
      'societe': societe,
      'periodeRestaurant': periodeRestaurant,
      'valeurDebutMois': valeurDebutMois,
      'arrondiContratSup': arrondiContratSup,
      'typeEvenements': typeEvenements,
      'jourFeriesRefs': jourFeriesRefs,
    };
  }
}
