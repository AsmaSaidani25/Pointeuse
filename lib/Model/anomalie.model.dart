class AnomalieModel {
  int? idAnomalie;
  String? idFrontPointage;
  int? idEmployee;
  int? idRestaurant;
  String? idFront;
  String? badgeEmployee;
  String? nomEmploye;
  bool? isPreAlarme;
  String? prenomEmploye;
  String? valeurDepasse;
  String? valeurContrainte;
  String? libelleAnomalie;
  String? codeAnomalie;
  bool? valide;
  dynamic dateAnomalie;

  AnomalieModel({
    this.idAnomalie,
    this.idFrontPointage,
    this.idEmployee,
    this.idRestaurant,
    this.idFront,
    this.badgeEmployee,
    this.nomEmploye,
    this.isPreAlarme,
    this.prenomEmploye,
    this.valeurDepasse,
    this.valeurContrainte,
    this.libelleAnomalie,
    this.codeAnomalie,
    this.valide,
    this.dateAnomalie,
  });

  factory AnomalieModel.fromJson(Map<String, dynamic> json) {
    return AnomalieModel(
      idAnomalie: json['idAnomalie'],
      idFrontPointage: json['idFrontPointage'],
      idEmployee: json['idEmployee'],
      idRestaurant: json['idRestaurant'],
      idFront: json['idFront'],
      badgeEmployee: json['badgeEmployee'],
      nomEmploye: json['nomEmploye'],
      isPreAlarme: json['isPreAlarme'],
      prenomEmploye: json['prenomEmploye'],
      valeurDepasse: json['valeurDepasse'],
      valeurContrainte: json['valeurContrainte'],
      libelleAnomalie: json['libelleAnomalie'],
      codeAnomalie: json['codeAnomalie'],
      valide: json['valide'],
      dateAnomalie: json['dateAnomalie'],
    );
  }

  factory AnomalieModel.fromMap(Map<String, dynamic> map) {
    return AnomalieModel(
      idAnomalie: map['idAnomalie'],
      idFrontPointage: map['idFrontPointage'],
      idEmployee: map['idEmployee'],
      idRestaurant: map['idRestaurant'],
      idFront: map['idFront'],
      badgeEmployee: map['badgeEmployee'],
      nomEmploye: map['nomEmploye'],
      isPreAlarme: map['isPreAlarme'],
      prenomEmploye: map['prenomEmploye'],
      valeurDepasse: map['valeurDepasse'],
      valeurContrainte: map['valeurContrainte'],
      libelleAnomalie: map['libelleAnomalie'],
      codeAnomalie: map['codeAnomalie'],
      valide: map['valide'],
      dateAnomalie: DateTime.tryParse(map['dateAnomalie']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idAnomalie': idAnomalie,
      'idFrontPointage': idFrontPointage,
      'idEmployee': idEmployee,
      'idRestaurant': idRestaurant,
      'idFront': idFront,
      'badgeEmployee': badgeEmployee,
      'nomEmploye': nomEmploye,
      'isPreAlarme': isPreAlarme,
      'prenomEmploye': prenomEmploye,
      'valeurDepasse': valeurDepasse,
      'valeurContrainte': valeurContrainte,
      'libelleAnomalie': libelleAnomalie,
      'codeAnomalie': codeAnomalie,
      'valide': valide,
      'dateAnomalie': dateAnomalie,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'idAnomalie': idAnomalie,
      'idFrontPointage': idFrontPointage,
      'idEmployee': idEmployee,
      'idRestaurant': idRestaurant,
      'idFront': idFront,
      'badgeEmployee': badgeEmployee,
      'nomEmploye': nomEmploye,
      'isPreAlarme': isPreAlarme,
      'prenomEmploye': prenomEmploye,
      'valeurDepasse': valeurDepasse,
      'valeurContrainte': valeurContrainte,
      'libelleAnomalie': libelleAnomalie,
      'codeAnomalie': codeAnomalie,
      'valide': valide,
      'dateAnomalie':
          dateAnomalie.toString(), // Convert the dynamic date to a string
    };
  }
}
