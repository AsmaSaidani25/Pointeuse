import 'package:pointeuse/Model/enumeration/jour.semaine.dart';

class ParametreNationauxModel {
  int? idParametreNationaux;
  late bool payerLeBreak;
  late bool inactiviteEstBreak;
  late dynamic dureePref;
  late dynamic dureeMin;
  late JourSemaine? premierJourSemaine;
  late JourSemaine? premierJourWeekend;
  late JourSemaine? dernierJourWeekend;
  late dynamic heureDebutWeekend;
  late dynamic heureFinWeekend;
  late dynamic dureeShift1;
  late dynamic dureeShift2;
  late dynamic dureeShift3;
  late dynamic dureeBreak1;
  late dynamic dureeBreak2;
  late dynamic dureeBreak3;
  late int ageJeuneFeminin;
  late int ageJeuneMasculin;

  ParametreNationauxModel({
    this.idParametreNationaux,
    required this.payerLeBreak,
    required this.inactiviteEstBreak,
    this.dureePref,
    this.dureeMin,
    this.premierJourSemaine,
    this.premierJourWeekend,
    this.dernierJourWeekend,
    this.heureDebutWeekend,
    this.heureFinWeekend,
    this.dureeShift1,
    this.dureeShift2,
    this.dureeShift3,
    this.dureeBreak1,
    this.dureeBreak2,
    this.dureeBreak3,
    required this.ageJeuneFeminin,
    required this.ageJeuneMasculin,
  });

  Map<String, dynamic> toJson() {
    return {
      'idParametreNationaux': idParametreNationaux,
      'payerLeBreak': payerLeBreak,
      'inactiviteEstBreak': inactiviteEstBreak,
      'dureePref': dureePref,
      'dureeMin': dureeMin,
      'premierJourSemaine':
          premierJourSemaine?.toString(), // Convert JourSemaine enum to string
      'premierJourWeekend': premierJourWeekend?.toString(),
      'dernierJourWeekend': dernierJourWeekend?.toString(),
      'heureDebutWeekend': heureDebutWeekend,
      'heureFinWeekend': heureFinWeekend,
      'dureeShift1': dureeShift1,
      'dureeShift2': dureeShift2,
      'dureeShift3': dureeShift3,
      'dureeBreak1': dureeBreak1,
      'dureeBreak2': dureeBreak2,
      'dureeBreak3': dureeBreak3,
      'ageJeuneFeminin': ageJeuneFeminin,
      'ageJeuneMasculin': ageJeuneMasculin,
    };
  }

  factory ParametreNationauxModel.fromMap(Map<String, dynamic> map) {
    return ParametreNationauxModel(
      idParametreNationaux: map['idParametreNationaux'],
      payerLeBreak: map['payerLeBreak'],
      inactiviteEstBreak: map['inactiviteEstBreak'],
      dureePref: map['dureePref'],
      dureeMin: map['dureeMin'],
      premierJourSemaine: map['premierJourSemaine'] != null
          ? JourSemaine.values[map['premierJourSemaine']]
          : null,
      premierJourWeekend: map['premierJourWeekend'] != null
          ? JourSemaine.values[map['premierJourWeekend']]
          : null,
      dernierJourWeekend: map['dernierJourWeekend'] != null
          ? JourSemaine.values[map['dernierJourWeekend']]
          : null,
      heureDebutWeekend: map['heureDebutWeekend'],
      heureFinWeekend: map['heureFinWeekend'],
      dureeShift1: map['dureeShift1'],
      dureeShift2: map['dureeShift2'],
      dureeShift3: map['dureeShift3'],
      dureeBreak1: map['dureeBreak1'],
      dureeBreak2: map['dureeBreak2'],
      dureeBreak3: map['dureeBreak3'],
      ageJeuneFeminin: map['ageJeuneFeminin'],
      ageJeuneMasculin: map['ageJeuneMasculin'],
    );
  }
  factory ParametreNationauxModel.fromJson(Map<String, dynamic> map) {
    return ParametreNationauxModel(
      idParametreNationaux: map['idParametreNationaux'] ?? '',
      payerLeBreak: map['payerLeBreak'] ?? false,
      inactiviteEstBreak: map['inactiviteEstBreak'] ?? false,
      dureePref: map['dureePref'] as String? ?? '',
      dureeMin: map['dureeMin'] as String? ?? '',
      premierJourSemaine: map['premierJourSemaine'] != null
          ? JourSemaine.values.firstWhere(
              (e) => e.toString() == 'JourSemaine.${map['premierJourSemaine']}',
            )
          : null,
      premierJourWeekend: map['premierJourWeekend'] != null
          ? JourSemaine.values.firstWhere(
              (e) => e.toString() == 'JourSemaine.${map['premierJourWeekend']}',
            )
          : null,
      dernierJourWeekend: map['dernierJourWeekend'] != null
          ? JourSemaine.values.firstWhere(
              (e) => e.toString() == 'JourSemaine.${map['dernierJourWeekend']}',
            )
          : null,
      heureDebutWeekend: map['heureDebutWeekend'] as String? ?? '',
      heureFinWeekend: map['heureFinWeekend'] as String? ?? '',
      dureeShift1: map['dureeShift1'] as String? ?? '',
      dureeShift2: map['dureeShift2'] as String? ?? '',
      dureeShift3: map['dureeShift3'] as String? ?? '',
      dureeBreak1: map['dureeBreak1'] as String? ?? '',
      dureeBreak2: map['dureeBreak2'] as String? ?? '',
      dureeBreak3: map['dureeBreak3'] as String? ?? '',
      ageJeuneFeminin: map['ageJeuneFeminin'] ?? '',
      ageJeuneMasculin: map['ageJeuneMasculin'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idParametreNationaux': idParametreNationaux,
      'payerLeBreak': payerLeBreak,
      'inactiviteEstBreak': inactiviteEstBreak,
      'dureePref': dureePref,
      'dureeMin': dureeMin,
      'premierJourSemaine': premierJourSemaine?.index,
      'premierJourWeekend': premierJourWeekend?.index,
      'dernierJourWeekend': dernierJourWeekend?.index,
      'heureDebutWeekend': heureDebutWeekend,
      'heureFinWeekend': heureFinWeekend,
      'dureeShift1': dureeShift1,
      'dureeShift2': dureeShift2,
      'dureeShift3': dureeShift3,
      'dureeBreak1': dureeBreak1,
      'dureeBreak2': dureeBreak2,
      'dureeBreak3': dureeBreak3,
      'ageJeuneFeminin': ageJeuneFeminin,
      'ageJeuneMasculin': ageJeuneMasculin,
    };
  }
}
