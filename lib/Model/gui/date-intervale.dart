class DateInterval {
  String? dateJournee;
  String? heureDebut;
  String? heureDebutAcheval;
  bool? heureDebutIsNight;
  String? heureFin;
  bool? heureFinIsNight;
  bool? isAcheval;

  DateInterval({
    this.dateJournee,
    this.heureDebut,
    this.heureDebutAcheval,
    this.heureDebutIsNight,
    this.heureFin,
    this.heureFinIsNight,
    this.isAcheval,
  });

  factory DateInterval.fromMap(Map<String, dynamic> map) {
    return DateInterval(
      dateJournee: map['dateJournee'],
      heureDebut: map['heureDebut'],
      heureDebutAcheval: map['heureDebutAcheval'],
      heureDebutIsNight: map['heureDebutIsNight'],
      heureFin: map['heureFin'],
      heureFinIsNight: map['heureFinIsNight'],
      isAcheval: map['isAcheval'],
    );
  }
}
