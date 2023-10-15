enum EtatPretEnumeration {
  ACTIF,
  INACTIF,
  EMBAUCHE,
}
EtatPretEnumeration etatPretFromMap(String value) {
  switch (value) {
    case 'ACTIF':
      return EtatPretEnumeration.ACTIF;
    case 'INACTIF':
      return EtatPretEnumeration.INACTIF;
    case 'EMBAUCHE':
      return EtatPretEnumeration.EMBAUCHE;
    default:
      throw ArgumentError('Unknown value: $value');
  }
}

EtatPretEnumeration getEtatPretFromString(String input) {
  try {
    return etatPretFromMap(input);
  } catch (e) {
    throw e; // Re-throw the error if you want to handle it elsewhere.
  }
}
