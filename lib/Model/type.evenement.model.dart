class TypeEvenementModel {
  int idTypeEvenement;
  String code;
  String libelle;
  String codeGdh;
  String codePaye;
  bool payer;
  bool travaille;
  bool previsible;
  bool statut;

  TypeEvenementModel({
    required this.idTypeEvenement,
    required this.code,
    required this.libelle,
    required this.codeGdh,
    required this.codePaye,
    required this.payer,
    required this.travaille,
    required this.previsible,
    required this.statut,
  });
  factory TypeEvenementModel.fromJson(Map<String, dynamic> map) {
    return TypeEvenementModel(
      idTypeEvenement: map['idTypeEvenement'],
      code: map['code'],
      libelle: map['libelle'],
      codeGdh: map['codeGdh'],
      codePaye: map['codePaye'],
      payer: map['payer'],
      travaille: map['travaille'],
      previsible: map['previsible'],
      statut: map['statut'],
    );
  }
  factory TypeEvenementModel.fromMap(Map<String, dynamic> map) {
    return TypeEvenementModel(
      idTypeEvenement: map['idTypeEvenement'],
      code: map['code'],
      libelle: map['libelle'],
      codeGdh: map['codeGdh'],
      codePaye: map['codePaye'],
      payer: map['payer'],
      travaille: map['travaille'],
      previsible: map['previsible'],
      statut: map['statut'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idTypeEvenement': idTypeEvenement,
      'code': code,
      'libelle': libelle,
      'codeGdh': codeGdh,
      'codePaye': codePaye,
      'payer': payer,
      'travaille': travaille,
      'previsible': previsible,
      'statut': statut,
    };
  }
}
