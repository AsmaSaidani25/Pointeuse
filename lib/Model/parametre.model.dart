class ParametreModel {
  String? idFront;
  int? idParametre;
  late String rubrique;
  late String param;
  late String description;
  late dynamic valeur;
  late bool booleanValue;
  late bool wrongValue;
  late bool isTime;
  late bool floatValue;

  ParametreModel({
    this.idFront,
    this.idParametre,
    required this.rubrique,
    required this.param,
    required this.description,
    this.valeur,
    required this.booleanValue,
    required this.wrongValue,
    required this.isTime,
    required this.floatValue,
  });
  Map<String, dynamic> toMap() {
    return {
      'idFront': idFront,
      'idParametre': idParametre,
      'rubrique': rubrique,
      'param': param,
      'description': description,
      'valeur': valeur,
      'booleanValue': booleanValue,
      'wrongValue': wrongValue,
      'isTime': isTime,
      'floatValue': floatValue,
    };
  }

  factory ParametreModel.fromJson(Map<String, dynamic> json) {
    return ParametreModel(
      idFront: json['idFront'] ?? '',
      idParametre: json['idParametre'] ?? '',
      rubrique: json['rubrique'] ?? '',
      param: json['param'] ?? '',
      description: json['description'] ?? '',
      valeur: json['valeur'] ?? '',
      booleanValue: json['booleanValue'] ?? false,
      wrongValue: json['wrongValue'] ?? false,
      isTime: json['isTime'] ?? false,
      floatValue: json['floatValue'] ?? false, // Convert to double if not null.
    );
  }

  factory ParametreModel.fromMap(Map<String, dynamic> map) {
    return ParametreModel(
      idFront: map['idFront'],
      idParametre: map['idParametre'],
      rubrique: map['rubrique'],
      param: map['param'],
      description: map['description'],
      valeur: map['valeur'],
      booleanValue: map['booleanValue'],
      wrongValue: map['wrongValue'],
      isTime: map['isTime'],
      floatValue: map['floatValue'],
    );
  }
}
