class DecoupageHoraireModel {
  late int idDecoupageHoraire;

  late dynamic valeurDimanche;
  late bool valeurDimancheIsNight;
  late bool valeurDimancheIsNew;
  late String idFront;

  late dynamic valeurLundi;
  late bool valeurLundiIsNight;
  late bool valeurLundiIsNew;

  late dynamic valeurMardi;
  late bool valeurMardiIsNight;
  late bool valeurMardiIsNew;

  late dynamic valeurMercredi;
  late bool valeurMercrediIsNight;
  late bool valeurMercrediIsNew;

  late dynamic valeurJeudi;
  late bool valeurJeudiIsNight;
  late bool valeurJeudiIsNew;

  dynamic valeurVendredi;
  late bool valeurVendrediIsNight;
  late bool valeurVendrediIsNew;

  late dynamic valeurSamedi;
  late bool valeurSamediIsNight;
  late bool valeurSamediIsNew;

  late bool hasCorrectValue;

  late bool isVisited;
  late bool canDelete;
  late DateTime debut; // Example property
  late DateTime fin;

  late String phaseLibelle;
  final Map<String, dynamic> properties = {};
  dynamic operator [](String propertyName) {
    if (properties.containsKey(propertyName)) {
      return properties[propertyName];
    }
    return null; // or throw an error for unknown properties
  }

  void operator []=(String propertyName, dynamic value) {
    properties[propertyName] = value;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.isGetter) {
      final propertyName =
          invocation.memberName.toString().substring(8); // Removing 'get:'
      return this[propertyName];
    } else if (invocation.isSetter) {
      final propertyName = invocation.memberName.toString().substring(
          8,
          invocation.memberName.toString().length -
              1); // Removing 'set:' and trailing '='
      this[propertyName] = invocation.positionalArguments[0];
      return null;
    }
    return super.noSuchMethod(invocation);
  }

  DecoupageHoraireModel({
    required this.idDecoupageHoraire,
    this.valeurDimanche,
    required this.valeurDimancheIsNight,
    required this.valeurDimancheIsNew,
    required this.idFront,
    this.valeurLundi,
    required this.valeurLundiIsNight,
    required this.valeurLundiIsNew,
    this.valeurMardi,
    required this.valeurMardiIsNight,
    required this.valeurMardiIsNew,
    this.valeurMercredi,
    required this.valeurMercrediIsNight,
    required this.valeurMercrediIsNew,
    this.valeurJeudi,
    required this.valeurJeudiIsNight,
    required this.valeurJeudiIsNew,
    this.valeurVendredi,
    required this.valeurVendrediIsNight,
    required this.valeurVendrediIsNew,
    this.valeurSamedi,
    required this.valeurSamediIsNight,
    required this.valeurSamediIsNew,
    required this.hasCorrectValue,
    required this.isVisited,
    required this.canDelete,
    required this.phaseLibelle,
    required this.debut,
    required this.fin,
  });
  DecoupageHoraireModel.fromJson(Map<String, dynamic> json) {
    idDecoupageHoraire = json['idDecoupageHoraire'];
    valeurDimanche = json['valeurDimanche'];
    valeurDimancheIsNight = json['valeurDimancheIsNight'];
    valeurDimancheIsNew = json['valeurDimancheIsNew'];
    idFront = json['idFront'];
    valeurLundi = json['valeurLundi'];
    valeurLundiIsNight = json['valeurLundiIsNight'];
    valeurLundiIsNew = json['valeurLundiIsNew'];
    valeurMardi = json['valeurMardi'];
    valeurMardiIsNight = json['valeurMardiIsNight'];
    valeurMardiIsNew = json['valeurMardiIsNew'];
    valeurMercredi = json['valeurMercredi'];
    valeurMercrediIsNight = json['valeurMercrediIsNight'];
    valeurMercrediIsNew = json['valeurMercrediIsNew'];
    valeurJeudi = json['valeurJeudi'];
    valeurJeudiIsNight = json['valeurJeudiIsNight'];
    valeurJeudiIsNew = json['valeurJeudiIsNew'];
    valeurVendredi = json['valeurVendredi'];
    valeurVendrediIsNight = json['valeurVendrediIsNight'];
    valeurVendrediIsNew = json['valeurVendrediIsNew'];
    valeurSamedi = json['valeurSamedi'];
    valeurSamediIsNight = json['valeurSamediIsNight'];
    valeurSamediIsNew = json['valeurSamediIsNew'];
    hasCorrectValue = json['hasCorrectValue'];
    isVisited = json['isVisited'];
    canDelete = json['canDelete'];
    phaseLibelle = json['phaseLibelle'];
    debut = json['debut'];
    fin = json['fin'];
  }
  factory DecoupageHoraireModel.fromMap(Map<String, dynamic> map) {
    return DecoupageHoraireModel(
      idDecoupageHoraire: map['idDecoupageHoraire'],
      valeurDimanche: map['valeurDimanche'],
      valeurDimancheIsNight: map['valeurDimancheIsNight'],
      valeurDimancheIsNew: map['valeurDimancheIsNew'],
      idFront: map['idFront'],
      valeurLundi: map['valeurLundi'],
      valeurLundiIsNight: map['valeurLundiIsNight'],
      valeurLundiIsNew: map['valeurLundiIsNew'],
      valeurMardi: map['valeurMardi'],
      valeurMardiIsNight: map['valeurMardiIsNight'],
      valeurMardiIsNew: map['valeurMardiIsNew'],
      valeurMercredi: map['valeurMercredi'],
      valeurMercrediIsNight: map['valeurMercrediIsNight'],
      valeurMercrediIsNew: map['valeurMercrediIsNew'],
      valeurJeudi: map['valeurJeudi'],
      valeurJeudiIsNight: map['valeurJeudiIsNight'],
      valeurJeudiIsNew: map['valeurJeudiIsNew'],
      valeurVendredi: map['valeurVendredi'],
      valeurVendrediIsNight: map['valeurVendrediIsNight'],
      valeurVendrediIsNew: map['valeurVendrediIsNew'],
      valeurSamedi: map['valeurSamedi'],
      valeurSamediIsNight: map['valeurSamediIsNight'],
      valeurSamediIsNew: map['valeurSamediIsNew'],
      hasCorrectValue: map['hasCorrectValue'],
      isVisited: map['isVisited'],
      canDelete: map['canDelete'],
      phaseLibelle: map['phaseLibelle'],
      debut: map['debut'],
      fin: map['fin'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idDecoupageHoraire': idDecoupageHoraire,
      'valeurDimanche': valeurDimanche,
      'valeurDimancheIsNight': valeurDimancheIsNight,
      'valeurDimancheIsNew': valeurDimancheIsNew,
      'idFront': idFront,
      'valeurLundi': valeurLundi,
      'valeurLundiIsNight': valeurLundiIsNight,
      'valeurLundiIsNew': valeurLundiIsNew,
      'valeurMardi': valeurMardi,
      'valeurMardiIsNight': valeurMardiIsNight,
      'valeurMardiIsNew': valeurMardiIsNew,
      'valeurMercredi': valeurMercredi,
      'valeurMercrediIsNight': valeurMercrediIsNight,
      'valeurMercrediIsNew': valeurMercrediIsNew,
      'valeurJeudi': valeurJeudi,
      'valeurJeudiIsNight': valeurJeudiIsNight,
      'valeurJeudiIsNew': valeurJeudiIsNew,
      'valeurVendredi': valeurVendredi,
      'valeurVendrediIsNight': valeurVendrediIsNight,
      'valeurVendrediIsNew': valeurVendrediIsNew,
      'valeurSamedi': valeurSamedi,
      'valeurSamediIsNight': valeurSamediIsNight,
      'valeurSamediIsNew': valeurSamediIsNew,
      'hasCorrectValue': hasCorrectValue,
      'isVisited': isVisited,
      'canDelete': canDelete,
      'phaseLibelle': phaseLibelle,
    };
  }
}
