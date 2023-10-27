import 'package:pointeuse/Model/shift.model.dart';

import 'absence.conge.model.dart';
import 'badge.dart';
import 'enumeration/EtatPret.enum.dart';
import 'enumeration/RestaurantPret.enum.dart';
import 'enumeration/Sexe.enum.dart';
import 'enumeration/SituationFamiliale.enum.dart';
import 'groupeTravail.model.dart';
import 'loi.employee.model.dart';
import 'loi.pays.model.dart';

class EmployeeModel {
  var idEmployee;
  String? idFront;
  var matricule;
  var email;
  var restaurantId;
  var idRestaurant;
  var sexe;
  var nom;
  var prenom;
  var adresse;
  var nomJeuneFille;
  var situationFamiliale;
  var dateNaissance;
  var codePostal;
  var ville;
  var numTelephone;
  var numPortable;
  var dateEntree;
  var dateSortie;
  var dateRemise;
  var dateRestitution;
  var motifSortie;
  var statut = false;
  var majeur;
  var etat;
  var carte;
  var hebdoCourant;
  var complAdresse;
  bool hasLaws;
  BadgeModel? badge;
  List<String> sexeEnumeration = Sexe.values.map((e) => e.toString()).toList();
  List<String> situationFamilialEnumeration =
      StituationFamiliale.values.map((e) => e.toString()).toList();
  var finValiditeSejour;
  var finValiditeAutorisationTravail;
  List<String> restaurantDePret =
      RestaurantDePretEnumeration.values.map((e) => e.toString()).toList();

  // cette variable sera utilisé pour afficher le nom et le prenom de l'employee dans le dropdown
  String? displayedName;
  GroupeTravailModel? groupeTravail;
  List<AbsenceCongeModel> absenceConges = [];
  List<LoiEmployeeModel> loiSpecifiques = [];
  List<LoiPaysModel> loiPointeuse = [];
  // calcule des differences des heures dans le shift fixe
  var totalRowTime;
  var fullName;
  var disablePlanningManagerOrLeaderOrFixe = false;
  var isSelected = false;
  List<ShiftModel> shifts = [];

  EmployeeModel(
      {EtatPretEnumeration? etatPret,
      idEmployee,
      idFront,
      matricule,
      email,
      restaurantId,
      idRestaurant,
      sexe,
      nom,
      prenom,
      adresse,
      nomJeuneFille,
      situationFamiliale,
      dateNaissance,
      ville,
      codePostal,
      numTelephone,
      numPortable,
      dateEntree,
      dateSortie,
      dateRemise,
      dateRestitution,
      motifSortie,
      statut,
      majeur,
      etat,
      carte,
      hebdoCourant,
      complAdresse,
      required this.hasLaws,
      badge,
      required List<String> sexeEnumeration,
      required List<String> situationFamilialEnumeration,
      finValiditeSejour,
      finValiditeAutorisationTravail,
      required List<String> restaurantDePret,
      displayedName,
      fullName,
      totalRowTime,
      isSelected,
      prete,
      disablePlanningManagerOrLeaderOrFixe,
      required List<LoiPaysModel> loiPointeuse,
      required List<LoiEmployeeModel> loiSpecifiques,
      required List<AbsenceCongeModel> absenceConges,
      required List<ShiftModel> shifts,
      groupeTravail});

  var prete;
  EtatPretEnumeration? etatPret;

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
        sexeEnumeration: [],
        situationFamilialEnumeration: [],
        loiPointeuse: [],
        loiSpecifiques: [],
        absenceConges: [],
        restaurantDePret: [],
        shifts: [],
        hasLaws: false)
      ..idEmployee = map['idEmployee']
      ..idFront = map['idFront']
      ..matricule = map['matricule']
      ..email = map['email']
      ..restaurantId = map['restaurantId']
      ..idRestaurant = map['idRestaurant']
      ..sexe = map['sexe']
      ..nom = map['nom']
      ..prenom = map['prenom']
      ..adresse = map['adresse']
      ..nomJeuneFille = map['nomJeuneFille']
      ..situationFamiliale = map['situationFamiliale']
      ..dateNaissance = map['dateNaissance']
      ..codePostal = map['codePostal']
      ..ville = map['ville']
      ..numTelephone = map['numTelephone']
      ..numPortable = map['numPortable']
      ..dateEntree = map['dateEntree']
      ..dateSortie = map['dateSortie']
      ..dateRemise = map['dateRemise']
      ..dateRestitution = map['dateRestitution']
      ..motifSortie = map['motifSortie']
      ..statut = map['statut']
      ..majeur = map['majeur']
      ..etat = map['etat']
      ..carte = map['carte']
      ..hebdoCourant = map['hebdoCourant']
      ..complAdresse = map['complAdresse']
      ..hasLaws = map['hasLaws']
      ..badge = map['badge'] != null ? BadgeModel.fromMap(map['badge']) : null
      ..finValiditeSejour = map['finValiditeSejour']
      ..finValiditeAutorisationTravail = map['finValiditeAutorisationTravail']
      ..displayedName = map['displayedName']
      ..groupeTravail = map['groupeTravail'] != null
          ? GroupeTravailModel.fromMap(map['groupeTravail'])
          : null
      ..absenceConges = List<AbsenceCongeModel>.from(
          map['absenceConges']?.map((x) => AbsenceCongeModel.fromMap(x)) ?? [])
      ..loiSpecifiques = List<LoiEmployeeModel>.from(
          map['loiSpecifiques']?.map((x) => LoiEmployeeModel.fromMap(x)) ?? [])
      ..loiPointeuse = List<LoiPaysModel>.from(
          map['loiPointeuse']?.map((x) => LoiPaysModel.fromMap(x)) ?? [])
      ..totalRowTime = map['totalRowTime']
      ..fullName = map['fullName']
      ..disablePlanningManagerOrLeaderOrFixe =
          map['disablePlanningManagerOrLeaderOrFixe']
      ..isSelected = map['isSelected']
      ..prete = map['prete']
      ..etatPret =
          map['etatPret'] != null ? getEtatPretFromString('etatPret') : null
      ..restaurantDePret = (map['restaurantDePret'] != null
          ? getEtatPretFromString('restaurantDePret')
          : null) as List<String>;
  }

  Map<String, dynamic> toMap() {
    return {
      'idEmployee': idEmployee,
      'idFront': idFront,
      'matricule': matricule,
      'email': email,
      'restaurantId': restaurantId,
      'idRestaurant': idRestaurant,
      'sexe': sexe,
      'nom': nom,
      'prenom': prenom,
      'adresse': adresse,
      'nomJeuneFille': nomJeuneFille,
      'situationFamiliale': situationFamiliale,
      'dateNaissance': dateNaissance,
      'codePostal': codePostal,
      'ville': ville,
      'numTelephone': numTelephone,
      'numPortable': numPortable,
      'dateEntree': dateEntree,
      'dateSortie': dateSortie,
      'dateRemise': dateRemise,
      'dateRestitution': dateRestitution,
      'motifSortie': motifSortie,
      'statut': statut,
      'majeur': majeur,
      'etat': etat,
      'carte': carte,
      'hebdoCourant': hebdoCourant,
      'complAdresse': complAdresse,
      'hasLaws': hasLaws,
      'badge': badge?.toMap(),
      'finValiditeSejour': finValiditeSejour,
      'finValiditeAutorisationTravail': finValiditeAutorisationTravail,
      'displayedName': displayedName,
      'groupeTravail': groupeTravail?.toMap(),
      'absenceConges': List<dynamic>.from(absenceConges.map((x) => x.toMap())),
      'loiSpecifiques':
          List<dynamic>.from(loiSpecifiques.map((x) => x.toMap())),
      'loiPointeuse': List<dynamic>.from(loiPointeuse.map((x) => x.toMap())),
      'totalRowTime': totalRowTime,
      'fullName': fullName,
      'disablePlanningManagerOrLeaderOrFixe':
          disablePlanningManagerOrLeaderOrFixe,
      'isSelected': isSelected,
      'prete': prete,
      'etatPret': etatPret?.toString(),
      'restaurantDePret': restaurantDePret.toString(),
    };
  }

  // Factory constructor to create an EmployeeModel from a map
  factory EmployeeModel.fromJson(Map<String, dynamic> map) {
    return EmployeeModel(
      idEmployee: map['idEmployee'] ?? '',
      idFront: map['idFront'] ?? '',
      matricule: map['matricule'] ?? '',
      email: map['email'] ?? '',
      restaurantId: map['restaurantId'] ?? '',
      idRestaurant: map['idRestaurant'] ?? '',
      sexe: map['sexe'] ?? '',
      nom: map['nom'] ?? '',
      prenom: map['prenom'] ?? '',
      adresse: map['adresse'] ?? '',
      nomJeuneFille: map['nomJeuneFille'] ?? '',
      situationFamiliale: map['situationFamiliale'] ?? '',
      dateNaissance: map['dateNaissance'] ?? '',
      codePostal: map['codePostal'] ?? '',
      ville: map['ville'] ?? '',
      numTelephone: map['numTelephone'] ?? '',
      numPortable: map['numPortable'] ?? '',
      dateEntree: map['dateEntree'] ?? '',
      dateSortie: map['dateSortie'] ?? '',
      dateRemise: map['dateRemise'] ?? '',
      dateRestitution: map['dateRestitution'] ?? '',
      motifSortie: map['motifSortie'] ?? '',
      statut: map['statut'] ?? '',
      majeur: map['majeur'] ?? '',
      etat: map['etat'] ?? '',
      carte: map['carte'] ?? '',
      hebdoCourant: map['hebdoCourant'] ?? '',
      complAdresse: map['complAdresse'] ?? '',
      hasLaws: map['hasLaws'] ?? false,
      badge: map['badge'] != null
          ? BadgeModel.fromJson(map['badge'])
          : null, // You'll need to implement BadgeModel.fromJson
      // Handle enums
      sexeEnumeration: List<String>.from(map['sexeEnumeration'] ?? ''),
      situationFamilialEnumeration:
          List<String>.from(map['situationFamilialEnumeration'] ?? ''),
      // Rest of the properties
      finValiditeSejour: map['finValiditeSejour'] ?? '',
      finValiditeAutorisationTravail:
          map['finValiditeAutorisationTravail'] ?? '',
      restaurantDePret: List<String>.from(map['restaurantDePret'] ?? ''),
      displayedName: map['displayedName'],
      groupeTravail: map['groupeTravail'] != null
          ? GroupeTravailModel.fromJson(map['groupeTravail'])
          : null, // You'll need to implement GroupeTravailModel.fromJson
      // Handle lists
      absenceConges: List<AbsenceCongeModel>.from(
          map['absenceConges']?.map((x) => AbsenceCongeModel.fromJson(x))),
      loiSpecifiques: List<LoiEmployeeModel>.from(
          map['loiSpecifiques']?.map((x) => LoiEmployeeModel.fromJson(x))),
      loiPointeuse: List<LoiPaysModel>.from(
          map['loiPointeuse']?.map((x) => LoiPaysModel.fromJson(x))),
      // Rest of the properties
      totalRowTime: map['totalRowTime'] ?? '',
      fullName: map['fullName'] ?? '',
      disablePlanningManagerOrLeaderOrFixe:
          map['disablePlanningManagerOrLeaderOrFixe'] ?? '',
      isSelected: map['isSelected'] ?? '',
      prete: map['prete'] ?? '',
      etatPret: map['etatPret'] != null
          ? EtatPretEnumeration.values
              .firstWhere((e) => e.toString() == map['etatPret'])
          : null,
      shifts: [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'idEmployee': idEmployee,
      'idFront': idFront,
      'matricule': matricule,
      'email': email,
      'restaurantId': restaurantId,
      'idRestaurant': idRestaurant,
      'sexe': sexe,
      'nom': nom,
      'prenom': prenom,
      'adresse': adresse,
      'nomJeuneFille': nomJeuneFille,
      'situationFamiliale': situationFamiliale,
      'dateNaissance': dateNaissance,
      'codePostal': codePostal,
      'ville': ville,
      'numTelephone': numTelephone,
      'numPortable': numPortable,
      'dateEntree': dateEntree,
      'dateSortie': dateSortie,
      'dateRemise': dateRemise,
      'dateRestitution': dateRestitution,
      'motifSortie': motifSortie,
      'statut': statut,
      'majeur': majeur,
      'etat': etat,
      'carte': carte,
      'hebdoCourant': hebdoCourant,
      'complAdresse': complAdresse,
      'hasLaws': hasLaws,
      // 'badge': badge?.toJson(), // Convert BadgeModel to JSON
      'sexeEnumeration': sexeEnumeration,
      'situationFamilialEnumeration': situationFamilialEnumeration,
      'finValiditeSejour': finValiditeSejour,
      'finValiditeAutorisationTravail': finValiditeAutorisationTravail,
      'restaurantDePret': restaurantDePret,
      'displayedName': displayedName,
      // 'groupeTravail': groupeTravail?.toJson(), // Convert GroupeTravailModel to JSON
      //'absenceConges': absenceConges.map((ac) => ac.toJson()).toList(),
      //'loiSpecifiques': loiSpecifiques.map((ls) => ls.toJson()).toList(),
      //'loiPointeuse': loiPointeuse.map((lp) => lp.toJson()).toList(),
      'totalRowTime': totalRowTime,
      'fullName': fullName,
      'disablePlanningManagerOrLeaderOrFixe':
          disablePlanningManagerOrLeaderOrFixe,
      'isSelected': isSelected,
    };
  }
}
