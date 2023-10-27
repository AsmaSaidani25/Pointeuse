import 'package:pointeuse/Model/parametre.nationaux.model.dart';

import 'employee.model.dart'; // Importez la classe EmployeeModel

class RestaurantModel {
  int? idRestaurant;
  String? idFront;
  String libelle;
  String matricule;
  String adresse;
  String codePostal = '';
  String telephone = '';
  String telephone2 = '';
  String codeDebutMatricule = '';
  String numTVA = '';
  String siret = '';
  String codeAPE = '';
  String numURSSAF = '';
  String centreURSSAF = '';
  String pointRassemblement = '';
  dynamic typeRestaurant;
  bool defaultRestaurant;
  bool associationPointeuse;
  EmployeeModel? directeur; // Utilisez le type EmployeeModel
  String codePointeuse;
  String macPointeuse = '';
  String? uuid;
  dynamic pays;
  ParametreNationauxModel?
      parametreNationaux; // Utilisez le type ParametreNationauxModel
  dynamic societe;
  dynamic periodeRestaurant;
  int valeurDebutMois;
  bool arrondiContratSup;
  dynamic typeEvenements;
  dynamic jourFeriesRefs;
  var lastSynchronisation;
  var lastScheduledImportTime;
  var occupationalHealthServiceCode;
  var nomPrefecture;
  var adressPrefecture1;
  var codePostalPrefecture;
  var villePrefecture;
  var categorieConv;
  var telephonePrefecture1;
  var creationDate;
  var pointeuseAssociationDate;
  var parametrePlanning;
  var employees;
  var ecrans;
  var franchise;
  var parametreInfosPersonnelles;

  RestaurantModel({
    this.idRestaurant,
    this.idFront,
    required this.libelle,
    required this.matricule,
    required this.adresse,
    this.codePostal = '',
    this.telephone = '',
    this.telephone2 = '',
    this.codeDebutMatricule = '',
    this.numTVA = '',
    this.siret = '',
    this.codeAPE = '',
    this.numURSSAF = '',
    this.centreURSSAF = '',
    this.pointRassemblement = '',
    this.typeRestaurant,
    this.defaultRestaurant = false,
    this.associationPointeuse = false,
    this.directeur,
    required this.codePointeuse,
    this.macPointeuse = '',
    this.uuid,
    this.pays,
    required this.parametreNationaux,
    this.societe,
    this.periodeRestaurant,
    this.valeurDebutMois = 1,
    required this.arrondiContratSup,
    this.typeEvenements,
    this.jourFeriesRefs,
    this.lastSynchronisation,
    this.lastScheduledImportTime,
    this.occupationalHealthServiceCode,
    this.nomPrefecture,
    this.adressPrefecture1,
    this.codePostalPrefecture,
    this.villePrefecture,
    this.categorieConv,
    this.telephonePrefecture1,
    this.creationDate,
    this.pointeuseAssociationDate,
    this.parametrePlanning,
    this.employees,
    this.ecrans,
    this.franchise,
    this.parametreInfosPersonnelles,
  });

  // Méthode pour convertir l'objet en Map
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
      'associationPointeuse': associationPointeuse,
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

  // Méthode pour créer un objet RestaurantModel à partir d'un Map
  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
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
      directeur: EmployeeModel.fromMap(map['directeur']),
      codePointeuse: map['codePointeuse'],
      macPointeuse: map['macPointeuse'],
      uuid: map['uuid'],
      pays: map['pays'],
      parametreNationaux:
          ParametreNationauxModel.fromMap(map['parametreNationaux']),
      societe: map['societe'],
      periodeRestaurant: map['periodeRestaurant'],
      valeurDebutMois: map['valeurDebutMois'],
      arrondiContratSup: map['arrondiContratSup'],
      typeEvenements: map['typeEvenements'],
      jourFeriesRefs: map['jourFeriesRefs'],
    );
  }

  // Méthode pour créer un objet RestaurantModel à partir d'un Map JSON
  factory RestaurantModel.fromJson(Map<String, dynamic> map) {
    return RestaurantModel(
      idRestaurant: map['idRestaurant'] ?? '',
      idFront: map['idFront'] ?? '',
      libelle: map['libelle'] ?? '',
      matricule: map['matricule'] ?? '',
      adresse: map['adresse'] ?? '',
      codePostal: map['codePostal'] ?? '',
      telephone: map['telephone'] ?? '',
      telephone2: map['telephone2'] ?? '',
      codeDebutMatricule: map['codeDebutMatricule'] ?? '',
      numTVA: map['numTVA'] ?? '',
      siret: map['siret'] ?? '',
      codeAPE: map['codeAPE'] ?? '',
      numURSSAF: map['numURSSAF'] ?? '',
      centreURSSAF: map['centreURSSAF'] ?? '',
      pointRassemblement: map['pointRassemblement'] ?? '',
      typeRestaurant: map['typeRestaurant'] ?? '',
      defaultRestaurant: map['defaultRestaurant'] ?? false,
      associationPointeuse: map['associationPointeuse'] ?? false,
      directeur: map['directeur'] != null
          ? EmployeeModel.fromJson(map['directeur'])
          : null,
      codePointeuse: map['codePointeuse'] ?? '',
      macPointeuse: map['macPointeuse'] ?? '',
      uuid: map['uuid'] ?? '',
      pays: map['pays'] ?? '',
      parametreNationaux: map['parametreNationaux'] != null
          ? ParametreNationauxModel.fromJson(map['parametreNationaux'])
          : null,
      societe: map['societe'] ?? '',
      periodeRestaurant: map['periodeRestaurant'] ?? '',
      valeurDebutMois: map['valeurDebutMois'] ?? 1,
      arrondiContratSup: map['arrondiContratSup'] ?? false,
      typeEvenements: map['typeEvenements'] ?? '',
      jourFeriesRefs: map['jourFeriesRefs'] ?? '',
      lastSynchronisation: map['lastSynchronisation'] ?? '',
      lastScheduledImportTime: map['lastScheduledImportTime'] ?? '',
      occupationalHealthServiceCode: map['occupationalHealthServiceCode'] ?? '',
      nomPrefecture: map['nomPrefecture'] ?? '',
      adressPrefecture1: map['adressPrefecture1'] ?? '',
      codePostalPrefecture: map['codePostalPrefecture'] ?? '',
      villePrefecture: map['villePrefecture'] ?? '',
      categorieConv: map['categorieConv'] ?? '',
      telephonePrefecture1: map['telephonePrefecture1'] ?? '',
      creationDate: map['creationDate'] ?? '',
      pointeuseAssociationDate: map['pointeuseAssociationDate'] ?? '',
      parametrePlanning: map['parametrePlanning'] ?? '',
      employees: map['employees'] ?? '',
      ecrans: map['ecrans'] ?? '',
      franchise: map['franchise'] ?? '',
      parametreInfosPersonnelles: map['parametreInfosPersonnelles'] ?? '',
    );
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
      'directeur':
          directeur?.toJson(), // Assuming EmployeeModel has a toJson method
      'codePointeuse': codePointeuse,
      'macPointeuse': macPointeuse,
      'uuid': uuid,
      'pays': pays,
      'parametreNationaux': parametreNationaux
          ?.toJson(), // Assuming ParametreNationauxModel has a toJson method
      'societe': societe,
      'periodeRestaurant': periodeRestaurant,
      'valeurDebutMois': valeurDebutMois,
      'arrondiContratSup': arrondiContratSup,
      'typeEvenements': typeEvenements,
      'jourFeriesRefs': jourFeriesRefs,
      // Include other properties as needed
    };
  }
}
