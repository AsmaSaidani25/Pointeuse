class RestaurantGUI {
  String? _codePointeuse;
  String? _libelle; // Nullable type

  set codePointeuse(String? value) {
    _codePointeuse = value;
  }

  set libelle(String? value) {
    _libelle = value;
  }

  String? get libelle => _libelle;

  String? get codePointeuse => _codePointeuse;

  RestaurantGUI(this._codePointeuse, this._libelle);
  factory RestaurantGUI.fromJson(Map<String, dynamic> json) {
    return RestaurantGUI(
        json['codePointeuse'] as String?, json['libelle'] as String?);
  }
}
