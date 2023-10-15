class ParametreModel {
  String? idFront;
  int? idParametre;
  String? rubrique;
  String? param;
  String? description;
  dynamic valeur;
  bool? booleanValue;
  bool? wrongValue;
  bool? isTime;
  bool? floatValue;

  ParametreModel({
    this.idFront,
    this.idParametre,
    this.rubrique,
    this.param,
    this.description,
    this.valeur,
    this.booleanValue,
    this.wrongValue,
    this.isTime,
    this.floatValue,
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
      idFront: json['idFront'],
      idParametre: json['idParametre'],
      rubrique: json['rubrique'],
      param: json['param'],
      description: json['description'],
      valeur: json['valeur'],
      booleanValue: json['booleanValue'],
      wrongValue: json['wrongValue'],
      isTime: json['isTime'],
      floatValue:
          json['floatValue']?.toDouble(), // Convert to double if not null.
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
