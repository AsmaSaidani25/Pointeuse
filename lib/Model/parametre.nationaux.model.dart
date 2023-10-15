import 'package:pointeuse/Model/enumeration/jour.semaine.dart';

class ParametreNationauxModel {
  int? idParametreNationaux;
  bool? payerLeBreak;
  bool? inactiviteEstBreak;
  dynamic dureePref;
  dynamic dureeMin;
  JourSemaine? premierJourSemaine;
  JourSemaine? premierJourWeekend;
  JourSemaine? dernierJourWeekend;
  dynamic heureDebutWeekend;
  dynamic heureFinWeekend;
  dynamic dureeShift1;
  dynamic dureeShift2;
  dynamic dureeShift3;
  dynamic dureeBreak1;
  dynamic dureeBreak2;
  dynamic dureeBreak3;
  int? ageJeuneFeminin;
  int? ageJeuneMasculin;

  ParametreNationauxModel({
    this.idParametreNationaux,
    this.payerLeBreak,
    this.inactiviteEstBreak,
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
    this.ageJeuneFeminin,
    this.ageJeuneMasculin,
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
      idParametreNationaux: map['idParametreNationaux'],
      payerLeBreak: map['payerLeBreak'],
      inactiviteEstBreak: map['inactiviteEstBreak'],
      dureePref: map['dureePref'],
      dureeMin: map['dureeMin'],
      premierJourSemaine: map['premierJourSemaine'] != null
          ? JourSemaine.values
              .firstWhere((e) => e.toString() == map['premierJourSemaine'])
          : null,
      premierJourWeekend: map['premierJourWeekend'] != null
          ? JourSemaine.values
              .firstWhere((e) => e.toString() == map['premierJourWeekend'])
          : null,
      dernierJourWeekend: map['dernierJourWeekend'] != null
          ? JourSemaine.values
              .firstWhere((e) => e.toString() == map['dernierJourWeekend'])
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
