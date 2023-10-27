class AnomalieModel {
  int? idAnomalie;
  late String idFrontPointage;
  late int idEmployee;
  int? idRestaurant;
  String? idFront;
  late String badgeEmployee;
  late String nomEmploye;
  late bool isPreAlarme;
  late String? prenomEmploye;
  late String valeurDepasse;
  late String valeurContrainte;
  late String libelleAnomalie;
  late String codeAnomalie;
  late bool valide;
  late dynamic dateAnomalie;

  AnomalieModel({
    this.idAnomalie,
    required this.idFrontPointage,
    required this.idEmployee,
    this.idRestaurant,
    this.idFront,
    required this.badgeEmployee,
    required this.nomEmploye,
    required this.isPreAlarme,
    this.prenomEmploye,
    required this.valeurDepasse,
    required this.valeurContrainte,
    required this.libelleAnomalie,
    required this.codeAnomalie,
    required this.valide,
    this.dateAnomalie,
  });

  factory AnomalieModel.fromJson(Map<String, dynamic> json) {
    return AnomalieModel(
      idAnomalie: json['idAnomalie'] ?? '',
      idFrontPointage: json['idFrontPointage'] ?? '',
      idEmployee: json['idEmployee'] ?? '',
      idRestaurant: json['idRestaurant'] ?? '',
      idFront: json['idFront'] ?? '',
      badgeEmployee: json['badgeEmployee'] ?? '',
      nomEmploye: json['nomEmploye'] ?? '',
      isPreAlarme: json['isPreAlarme'] ?? false,
      prenomEmploye: json['prenomEmploye'] ?? '',
      valeurDepasse: json['valeurDepasse'] ?? '',
      valeurContrainte: json['valeurContrainte'] ?? '',
      libelleAnomalie: json['libelleAnomalie'] ?? '',
      codeAnomalie: json['codeAnomalie'] ?? '',
      valide: json['valide'] ?? false,
      dateAnomalie: json['dateAnomalie'] ?? '',
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
