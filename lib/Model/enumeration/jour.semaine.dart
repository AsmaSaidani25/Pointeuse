enum JourSemaine {
  LUNDI,
  MARDI,
  MERCREDI,
  JEUDI,
  VENDREDI,
  SAMEDI,
  DIMANCHE,
}

enum ENJourSemaine {
  DIMANCHE,
  LUNDI,
  MARDI,
  MERCREDI,
  JEUDI,
  VENDREDI,
  SAMEDI,
}

enum Mois {
  JAN,
  FEV,
  MARS,
  AVRIL,
  MAI,
  JUIN,
  JUL,
  AOUT,
  SEP,
  OCT,
  NOV,
  DEC,
}

extension JourSemaineExtension on JourSemaine {
  String toValue() {
    return this.toString().split('.').last;
  }

  static JourSemaine fromValue(String value) {
    return JourSemaine.values.firstWhere((e) => e.toValue() == value);
  }
}

extension ENJourSemaineExtension on ENJourSemaine {
  String toValue() {
    return this.toString().split('.').last;
  }

  static ENJourSemaine fromValue(String value) {
    return ENJourSemaine.values.firstWhere((e) => e.toValue() == value);
  }
}

extension MoisExtension on Mois {
  String toValue() {
    return this.toString().split('.').last;
  }

  static Mois fromValue(String value) {
    return Mois.values.firstWhere((e) => e.toValue() == value);
  }
}
