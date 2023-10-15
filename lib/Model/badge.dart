import 'employee.model.dart';

class BadgeModel {
  int? idBadge;
  String? code;
  dynamic dateDisponible;
  String? commentaire;
  EmployeeModel? employee;

  void init() {
    commentaire = '';
    code = '';
  }

  BadgeModel(
      {idBadge, code, dateDisponible, commentaire, EmployeeModel? employee});

  factory BadgeModel.fromJson(Map<String, dynamic> map) {
    return BadgeModel(
      idBadge: map['idBadge'],
      code: map['code'],
      dateDisponible: map['dateDisponible'],
      commentaire: map['commentaire'],
      employee: map['employee'] != null
          ? EmployeeModel.fromJson(map['employee'])
          : null,
    );
  }
  factory BadgeModel.fromMap(Map<String, dynamic> map) {
    return BadgeModel()
      ..idBadge = map['idBadge']
      ..code = map['code']
      ..dateDisponible = map['dateDisponible']
      ..commentaire = map['commentaire']
      ..employee = map['employee'] != null
          ? EmployeeModel.fromMap(map['employee'])
          : null;
  }

  Map<String, dynamic> toMap() {
    return {
      'idBadge': idBadge,
      'code': code,
      'dateDisponible': dateDisponible,
      'commentaire': commentaire,
      'employee': employee?.toMap(),
    };
  }
}
