class TypePointageModel {
  String idFront;
  int id;
  String libelle;
  bool statut;

  TypePointageModel({
    required this.idFront,
    required this.id,
    required this.libelle,
    required this.statut,
  });

  // Method to convert TypePointageModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'idFront': idFront,
      'id': id,
      'libelle': libelle,
      'statut': statut,
    };
  }

  factory TypePointageModel.fromMap(Map<String, dynamic> map) {
    return TypePointageModel(
        idFront: map['idFront'],
        id: map['id'],
        libelle: map['libelle'],
        statut: map['statut']);
  }
}
