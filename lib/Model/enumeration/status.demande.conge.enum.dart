enum StatusDemandeCongeEnumeration { VALIDE, NON_VALIDE, EN_ATTENTE }

extension StatusDemandeCongeExtension on StatusDemandeCongeEnumeration {
  String? get value {
    switch (this) {
      case StatusDemandeCongeEnumeration.VALIDE:
        return 'VALIDE';
      case StatusDemandeCongeEnumeration.NON_VALIDE:
        return 'NON_VALIDE';
      case StatusDemandeCongeEnumeration.EN_ATTENTE:
        return 'EN_ATTENTE';
      default:
        return null;
    }
  }

  static StatusDemandeCongeEnumeration? fromValue(String value) {
    switch (value) {
      case 'VALIDE':
        return StatusDemandeCongeEnumeration.VALIDE;
      case 'NON_VALIDE':
        return StatusDemandeCongeEnumeration.NON_VALIDE;
      case 'EN_ATTENTE':
        return StatusDemandeCongeEnumeration.EN_ATTENTE;
      default:
        return null;
    }
  }
}
