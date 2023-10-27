import 'loi.groupe.travail.model.dart';

class GroupeTravailModel {
  int? idGroupeTravail;
  late var libelle;
  late double tauxhoraire;
  late String idFront;
  late bool plgEquip;
  late bool plgMgr;
  late bool plghot;
  late bool plgFixe;
  late var codeEmploi;
  late double niveau;
  late var codeGdh;
  late bool mainOeuvre;
  late bool hasLaws;
  late bool statut;
  late bool directeur;
  late bool pointeuse;
  late bool disabledCheckBoxDirecteur;
  List<LoiGroupeTravailModel>? loiGroupeTravails;

  GroupeTravailModel(
      {loiGroupeTravails,
      idGroupeTravail,
      libelle,
      tauxhoraire,
      idFront,
      plgEquip,
      plgMgr,
      plghot,
      plgFixe,
      codeEmploi,
      niveau,
      codeGdh,
      mainOeuvre,
      hasLaws,
      statut,
      directeur,
      pointeuse,
      disabledCheckBoxDirecteur});
  factory GroupeTravailModel.fromJson(Map<String, dynamic> map) {
    return GroupeTravailModel(
      idGroupeTravail: map['idGroupeTravail'] ?? '',
      libelle: map['libelle'] ?? '',
      tauxhoraire: map['tauxhoraire'] ?? '',
      idFront: map['idFront'] ?? '',
      plgEquip: map['plgEquip'] ?? false,
      plgMgr: map['plgMgr'] ?? false,
      plghot: map['plghot'] ?? false,
      plgFixe: map['plgFixe'] ?? false,
      codeEmploi: map['codeEmploi'] ?? '',
      niveau: map['niveau'] ?? '',
      codeGdh: map['codeGdh'] ?? '',
      mainOeuvre: map['mainOeuvre'] ?? false,
      hasLaws: map['hasLaws'] ?? false,
      statut: map['statut'] ?? false,
      directeur: map['directeur'] ?? false,
      pointeuse: map['pointeuse'] ?? false,
      disabledCheckBoxDirecteur: map['disabledCheckBoxDirecteur'] ?? '',
      loiGroupeTravails: map['loiGroupeTravails'] != null
          ? List<LoiGroupeTravailModel>.from(
              map['loiGroupeTravails']
                  .map((x) => LoiGroupeTravailModel.fromJson(x)),
            )
          : null,
    );
  }
  factory GroupeTravailModel.fromMap(Map<String, dynamic> map) {
    return GroupeTravailModel()
      ..idGroupeTravail = map['idGroupeTravail']
      ..libelle = map['libelle']
      ..tauxhoraire = map['tauxhoraire']
      ..idFront = map['idFront']
      ..plgEquip = map['plgEquip']
      ..plgMgr = map['plgMgr']
      ..plghot = map['plghot']
      ..plgFixe = map['plgFixe']
      ..codeEmploi = map['codeEmploi']
      ..niveau = map['niveau']
      ..codeGdh = map['codeGdh']
      ..mainOeuvre = map['mainOeuvre']
      ..hasLaws = map['hasLaws']
      ..statut = map['statut']
      ..directeur = map['directeur']
      ..pointeuse = map['pointeuse']
      ..disabledCheckBoxDirecteur = map['disabledCheckBoxDirecteur']
      ..loiGroupeTravails = List<LoiGroupeTravailModel>.from(
          map['loiGroupeTravails']
                  ?.map((x) => LoiGroupeTravailModel.fromMap(x)) ??
              []);
  }

  Map<String, dynamic> toMap() {
    return {
      'idGroupeTravail': idGroupeTravail,
      'libelle': libelle,
      'tauxhoraire': tauxhoraire,
      'idFront': idFront,
      'plgEquip': plgEquip,
      'plgMgr': plgMgr,
      'plghot': plghot,
      'plgFixe': plgFixe,
      'codeEmploi': codeEmploi,
      'niveau': niveau,
      'codeGdh': codeGdh,
      'mainOeuvre': mainOeuvre,
      'hasLaws': hasLaws,
      'statut': statut,
      'directeur': directeur,
      'pointeuse': pointeuse,
      'disabledCheckBoxDirecteur': disabledCheckBoxDirecteur,
      'loiGroupeTravails':
          List<dynamic>.from(loiGroupeTravails?.map((x) => x.toMap()) ?? []),
    };
  }
}
