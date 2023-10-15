import 'DetailEvenement.model.dart';
import 'enumeration/status.demande.conge.enum.dart';

import 'type.evenement.model.dart';

class AbsenceCongeModel {
  int? idAbsenceConge;
  dynamic dateDebut;
  dynamic dateFin;
  dynamic heureDebut;
  bool? heureDebutValeurNuit;
  dynamic heureFin;
  bool? heureFinValeurNuit;
  int? dureeHeure;
  int? dureeJour;
  bool? periodeHoraire;
  StatusDemandeCongeEnumeration? status;
  TypeEvenementModel? typeEvenement;
  int? idEmployee;
  List<DetailEvenement>? detailEvenements;

  AbsenceCongeModel({
    idAbsenceConge,
    dateDebut,
    dateFin,
    heureDebut,
    heureDebutValeurNuit,
    heureFin,
    heureFinValeurNuit,
    dureeHeure,
    dureeJour,
    periodeHoraire,
    status,
    typeEvenement,
    idEmployee,
    List? detailEvenements,
  });

  factory AbsenceCongeModel.fromJson(Map<String, dynamic> map) {
    return AbsenceCongeModel(
      idAbsenceConge: map['idAbsenceConge'],
      dateDebut: map['dateDebut'],
      dateFin: map['dateFin'],
      heureDebut: map['heureDebut'],
      heureDebutValeurNuit: map['heureDebutValeurNuit'],
      heureFin: map['heureFin'],
      heureFinValeurNuit: map['heureFinValeurNuit'],
      dureeHeure: map['dureeHeure'],
      dureeJour: map['dureeJour'],
      periodeHoraire: map['periodeHoraire'],
      status: StatusDemandeCongeEnumeration.values,
      typeEvenement: TypeEvenementModel.fromJson(map['typeEvenement']),
      idEmployee: map[
          'idEmployee'], /*
      detailEvenements: (map['detailEvenements'] as List)
          ?.map((json) => DetailEvenement.fromJson(json))
          ?.toList(),*/
    );
  }

  factory AbsenceCongeModel.fromMap(Map<String, dynamic> map) {
    return AbsenceCongeModel()
      ..idAbsenceConge = map['idAbsenceConge']
      ..dateDebut = map['dateDebut']
      ..dateFin = map['dateFin']
      ..heureDebut = map['heureDebut']
      ..heureDebutValeurNuit = map['heureDebutValeurNuit']
      ..heureFin = map['heureFin']
      ..heureFinValeurNuit = map['heureFinValeurNuit']
      ..dureeHeure = map['dureeHeure']
      ..dureeJour = map['dureeJour']
      ..periodeHoraire = map['periodeHoraire']
      ..status = map['status'] != null
          ? StatusDemandeCongeEnumeration.values.firstWhere((e) =>
              e.toString() == 'StatusDemandeCongeEnumeration.' + map['status'])
          : null
      ..typeEvenement = map['typeEvenement'] != null
          ? TypeEvenementModel.fromMap(map['typeEvenement'])
          : null
      ..idEmployee = map['idEmployee']
      ..detailEvenements = List<DetailEvenement>.from(
          map['detailEvenements']?.map((x) => DetailEvenement.fromMap(x)) ??
              []);
  }

  Map<String, dynamic> toMap() {
    return {
      'idAbsenceConge': idAbsenceConge,
      'dateDebut': dateDebut,
      'dateFin': dateFin,
      'heureDebut': heureDebut,
      'heureDebutValeurNuit': heureDebutValeurNuit,
      'heureFin': heureFin,
      'heureFinValeurNuit': heureFinValeurNuit,
      'dureeHeure': dureeHeure,
      'dureeJour': dureeJour,
      'periodeHoraire': periodeHoraire,
      'status': status?.toString().split('.').last,
      'typeEvenement': typeEvenement?.toMap(),
      'idEmployee': idEmployee,
      'detailEvenements':
          List<dynamic>.from(detailEvenements?.map((x) => x.toMap()) ?? []),
    };
  }
}
