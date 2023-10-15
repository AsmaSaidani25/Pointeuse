class DetailEvenement {
  int? idDetailEvenement;
  dynamic dateEvent;
  double? nbHeure;
  dynamic heureDebut;
  bool? heureDebutValeurNuit;
  dynamic heureFin;
  bool? heureFinValeurNuit;

  DetailEvenement({
    this.idDetailEvenement,
    this.dateEvent,
    this.nbHeure,
    this.heureDebut,
    this.heureDebutValeurNuit,
    this.heureFin,
    this.heureFinValeurNuit,
  });
  factory DetailEvenement.fromJson(Map<String, dynamic> map) {
    return DetailEvenement(
      idDetailEvenement: map['idDetailEvenement'],
      dateEvent: map['dateEvent'],
      nbHeure: map['nbHeure'],
      heureDebut: map['heureDebut'],
      heureDebutValeurNuit: map['heureDebutValeurNuit'],
      heureFin: map['heureFin'],
      heureFinValeurNuit: map['heureFinValeurNuit'],
    );
  }

  factory DetailEvenement.fromMap(Map<String, dynamic> map) {
    return DetailEvenement(
      idDetailEvenement: map['idDetailEvenement'],
      dateEvent: map['dateEvent'],
      nbHeure: map['nbHeure'],
      heureDebut: map['heureDebut'],
      heureDebutValeurNuit: map['heureDebutValeurNuit'],
      heureFin: map['heureFin'],
      heureFinValeurNuit: map['heureFinValeurNuit'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idDetailEvenement': idDetailEvenement,
      'dateEvent': dateEvent,
      'nbHeure': nbHeure,
      'heureDebut': heureDebut,
      'heureDebutValeurNuit': heureDebutValeurNuit,
      'heureFin': heureFin,
      'heureFinValeurNuit': heureFinValeurNuit,
    };
  }
}
