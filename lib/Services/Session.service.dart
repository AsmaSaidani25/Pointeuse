import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

class SessionService {
  static late SharedPreferences _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get uuid => null;

  // Singleton pattern
  //static final SessionService _instance = SessionService._internal();
  //factory SessionService() => _instance;

  static Future<void> setPointeuseState(dynamic state) async {
    final myValue = _prefs.setString('_State#', state.toString());
    print(myValue); // Do something with myValue
  }

  static bool get isConnected => _prefs.getBool('_isConnected') ?? false;

  static set isConnected(bool value) {
    _prefs.setBool('_isConnected', value);
  }

  static String? get refreshAfterMise => _prefs.getString('refreshMise');

  static set refreshAfterMise(String? value) {
    _prefs.setString('refreshMise', value ?? '');
  }

  static String? get refreshToken => _prefs.getString('refresh');

  static set refreshToken(String? refresh) {
    _prefs.setString('refresh', refresh ?? '');
  }

  static String? get refreshTimer => _prefs.getString('refreshTimer');

  static set refreshTimer(String? refreshTimer) {
    _prefs.setString('refreshTimer', refreshTimer ?? '');
  }

  static String? get employe => _prefs.getString('_EmpI#');

  static set employe(String? employeId) {
    _prefs.setString('_EmpI#', employeId ?? '');
  }

  static bool get isManager => _prefs.getBool('_isManager') ?? false;

  static set isManager(bool value) {
    _prefs.setBool('_isManager', value);
  }

  static bool get pointeuseState => _prefs.getBool('_State#') ?? false;

  static set pointeuseState(bool state) {
    _prefs.setBool('_State#', state);
  }

  static String? get employeFullName => _prefs.getString('_FullName#');

  static set employeFullName(String? fullName) {
    _prefs.setString('_FullName#', fullName ?? '');
  }

  static String? get idRestaurant => _prefs.getString('_Restaurant#');

  static set idRestaurant(String? restaurantId) {
    _prefs.setString('_Restaurant#', restaurantId ?? '');
  }

  static String? get codeRestaurant => _prefs.getString('_CodeRestaurant');

  static set codeRestaurant(String? codeRestaurant) {
    _prefs.setString('_CodeRestaurant', codeRestaurant ?? '');
  }

  static String? get restaurantName => _prefs.getString('_RestaurantName');

  static set restaurantName(String? restaurantName) {
    _prefs.setString('_RestaurantName', restaurantName ?? '');
  }

  static String? get badge => _prefs.getString('_CodeB#');

  static set badge(String? codeBadge) {
    _prefs.setString('_CodeB#', codeBadge ?? '');
  }

  static bool get isTechnicien => _prefs.getBool('_isTech') ?? false;

  static set isTechnicien(bool value) {
    _prefs.setBool('_isTech', value);
  }

  String? get bearerToken => _prefs.getString('token');

  String? get bearerTokenForV2 => _prefs.getString('T120');

  void deleteBearerToken() {
    _prefs.remove('T120');
  }

  static Future<void> setDateJournee(DateTime dateJournee) async {
    final formattedDate =
        '${dateJournee.year}-${(dateJournee.month + 1).toString().padLeft(2, '0')}-${dateJournee.day.toString().padLeft(2, '0')}';
    await _prefs.setString('_dateJournee', formattedDate);
  }

  static Future<void> setJournee(String journee) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('_journee', journee);
  }

  static Future<int?> getIdRestaurant() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedId = prefs.getString('_Restaurant#');
    if (encodedId != null) {
      List<int> bytes = base64.decode(encodedId);
      String decodedId = utf8.decode(bytes);
      return int.parse(decodedId);
    }
  }

  set bearerToken(String? token) {
    _prefs.setString('T120', token ?? '');
  }

  static String? get tokenPointeuse => _prefs.getString('token');

  static set tokenPointeuse(String? token) {
    _prefs.setString('token', token ?? '');
  }

  static bool get autorisation => _prefs.getBool('_Auth#') ?? false;

  static set autorisation(bool value) {
    _prefs.setBool('_Auth#', value);
  }

  static Future<String> getDateJournee() async {
    final myValue = _prefs.getString('_dateJournee');

    if (_prefs != null) {
      return myValue ?? '';
    } else {
      // Handle the case where _prefs is null (e.g., it's not initialized)
      throw Exception('Value for _dateJournee is null');
    }
  }

  void setPdfCorrectionPointageSettings(Map<String, dynamic> settings) {
    _prefs.setString('pdfCorrectionPointage', settings.toString());
  }

  Map<String, dynamic> getPdfCorrectionPointageSettings() {
    final settingsStr = _prefs.getString('pdfCorrectionPointage') ?? '';
    if (settingsStr.isNotEmpty) {
      final settingsMap = Map<String, dynamic>.from(json.decode(settingsStr));
      return settingsMap;
    } else {
      return <String, dynamic>{};
    }
  }

  static void setEmploye(int employeId) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final encodedId =
        base64.encode(Uint8List.fromList(employeId.toString().codeUnits));
    await sharedPreferences.setString('_EmpI#', encodedId);
  }

  static bool get mobile {
    if (Platform.isAndroid || Platform.isIOS) {
      return true;
    } else {
      return false;
    }
  }

  static String uuidGenerator(String idd) {
    int id = int.parse(idd);
    final uuidString = Uuid().v4();
    final firstPart = uuidString.substring(0, 10);
    final secondPart = uuidString.substring(10, 20);
    final result = '$firstPart${(id + 5555) * 133}$secondPart';
    return result;
  }

  static void setSyncPointageProgress(bool syncPointages) {
    if (_prefs != null) {
      final value = _prefs.setBool('syncPointages', syncPointages);
    } else {
      // Handle the case where _prefs is null (e.g., it's not initialized)
      throw Exception('SharedPreferences not initialized');
    }
  }

  static bool getSyncPointageProgress() {
    return _prefs.getBool('syncPointages') ?? false;
  }

  static Future<void> setSyncEmployesProgress(bool syncEmployes) async {
    //final prefs = await SharedPreferences.getInstance();

    // Check if _prefs has been initialized
    if (_prefs != null) {
      _prefs.setBool('syncEmployes', syncEmployes);
      final myValue = _prefs.setBool('syncEmployes', syncEmployes);
      print(myValue);
    } else {
      // Handle the case where _prefs is null (e.g., it's not initialized)
      throw Exception('SharedPreferences not initialized');
    }
  }

  static bool getSyncEmployesProgress() {
    return _prefs.getBool('syncEmployes') ?? false;
  }

  static void setSyncCorrectionsProgress(bool syncCorrections) {
    _prefs.setBool('syncCorrections', syncCorrections);
  }

  static bool getSyncCorrectionsProgress() {
    return _prefs.getBool('syncCorrections') ?? false;
  }

  static void setSyncParamProgress(bool syncParam) {
    _prefs.setBool('syncParam', syncParam);
  }

  static bool getSyncParamProgress() {
    return _prefs.getBool('syncParam') ?? false;
  }

  static void setSyncPlanningProgress(bool syncPlanning) {
    _prefs.setBool('syncPlanning', syncPlanning);
  }

  static bool getSyncPlanningProgress() {
    return _prefs.getBool('syncPlanning') ?? false;
  }

  static void setTimeToReload(int timeToReload) {
    _prefs.setInt('timeToReload', timeToReload);
  }

  static int getTimeToReload() {
    return _prefs.getInt('timeToReload') ?? 0;
  }

  static void setForceReload(bool forceReload) {
    _prefs.setBool('forceReload', forceReload);
  }

  static bool getForceReload() {
    return _prefs.getBool('forceReload') ?? false;
  }

  static void setDebutJournee(DateTime journee) {
    _prefs.setString('_DebutJournee', journee.toString());
  }

  static void setDroitModification(bool yesWeCan) {
    _prefs.setBool('_canModifie', yesWeCan);
  }

  static void setDroitAssociation(bool yesWeCan) {
    _prefs.setBool('_canAssociate', yesWeCan);
  }

  static void setstate(bool yesWeCan) {
    _prefs.setBool('associated', yesWeCan);
  }

  static bool getDroitModification() {
    return _prefs.getBool('_canModifie') ?? false;
  }

  static bool getDroitAssociation() {
    return _prefs.getBool('_canAssociate') ?? false;
  }

  static DateTime getDebutJournee() {
    final dateString = _prefs.getString('_DebutJournee');
    if (dateString != null && dateString.isNotEmpty) {
      return DateTime.parse(dateString);
    }
    return DateTime(0);
  }

  static DateTime getFinJournee() {
    final dateString = _prefs.getString('_finJournee');
    if (dateString != null && dateString.isNotEmpty) {
      return DateTime.parse(dateString);
    }
    return DateTime(0);
  }

  static DateTime getOuvertureInter() {
    final dateString = _prefs.getString('_ouverturJournee');
    if (dateString != null && dateString.isNotEmpty) {
      return DateTime.parse(dateString);
    }
    return DateTime(0);
  }

  static void setOuvertureInter(DateTime journee) {
    _prefs.setString('_ouverturJournee', journee.toString());
  }

  static void setIsTimePointerEntreeSortie(int IsTimePointerEntreeSortie) {
    _prefs.setInt('_isTimePointerEntreeSortie', IsTimePointerEntreeSortie);
  }

  static int getIsTimePointerEntreeSortie() {
    return _prefs.getInt('_isTimePointerEntreeSortie') ?? 0;
  }

  static void setDisplayDateOption(String option) {
    _prefs.setString('_affichage_date', option);
  }

  static String getDisplayDateOption() {
    return _prefs.getString('_affichage_date') ?? '';
  }

  static void setSyncPretsProgress(bool syncPointages) {
    _prefs.setBool('syncPrets', syncPointages);
  }

  static void deleteToken() {
    _prefs.remove('token');
  }

  static void setFinJournee(DateTime journee) {
    _prefs.setString('_finJournee', journee.toString());
  }

  static DateTime getLastSync() {
    final dateString = _prefs.getString('_LastSync');
    if (dateString != null && dateString.isNotEmpty) {
      return DateTime.parse(dateString);
    }
    return DateTime(0);
  }

  static String getLastSyncType() {
    final val = _prefs.getString('_LastSyncType') ?? '';
    switch (val) {
      case '1':
        return 'manuelle';
      case '0':
        return 'regulier';
      default:
        return 'noSyncType';
    }
  }

  static Future<void> setCodeRestaurant(String codeRestaurant) async {
    await _prefs.setString('_CodeRestaurant', codeRestaurant);
  }

  static Future<void> setIdRestaurant(String restaurantId) async {
    await _prefs.setString('_Restaurant#', restaurantId);
  }

  static Future<void> setRestaurantName(String restaurantName) async {
    await _prefs.setString('_RestaurantName', restaurantName);
  }

  static Future<bool> getIsTechnicien() async {
    final isTechString = _prefs.getString('_isTech');
    return isTechString == 'true';
  }

  static void setLastSync(String journee) {
    _prefs.setString('_LastSync', journee);
  }

  static void setLastSyncType(int type) {
    _prefs.setString('_LastSyncType', type == 1 ? '1' : '0');
  }

  static void setTotalPointe(String totalPointingHours) {
    _prefs.setString('_totalPoint', totalPointingHours);
  }

  static String getTotalPointe() {
    return _prefs.getString('_totalPoint') ?? '';
  }

  static void setNbrTotEmp(int length) {
    _prefs.setInt('_totalEMP', length);
  }

  static int getNbrTotEmp() {
    return _prefs.getInt('_totalEMP') ?? 0;
  }

  static bool getSyncPretsProgress() {
    return _prefs.getBool('syncPrets') ?? false;
  }

  static int getVolume() {
    return _prefs.getInt('volume') ?? 0;
  }

  static void setIsFirstTime(dynamic isFirstTimeAssociation) {
    _prefs.setString('popupShown', isFirstTimeAssociation.toString());
  }

  static void setTotEmpPlaned(dynamic totalDuration) {
    _prefs.setString('_totalDurationPlanned', totalDuration.toString());
  }

  static dynamic getTotEmpPlaned() {
    final value = _prefs.getString('_totalDurationPlanned');
    return value != null ? int.tryParse(value) : null;
  }

  static dynamic getIsFirstTime() {
    return _prefs.getString('popupShown');
  }

  static void setNbrTotempPointe(int val) {
    _prefs.setInt('_totalEmpPointed', val);
  }

  int getNbrTotempPointe() {
    return _prefs.getInt('_totalEmpPointed') ?? 0;
  }

  static void setVolume(int value) {
    _prefs.setInt('volume', value);
  }

  static void nbrTotEmp(int length) {
    _prefs.setInt('_totalEMP', length);
  }

  static void setDateProchFermeture(DateTime value) {
    _prefs.setString('_DateProchFermeture', value.toString());
  }

  static void setDateProchOuverture(DateTime value) {
    _prefs.setString('_DateProchOuverture', value.toString());
  }

  static void setDateProchDeblocage(DateTime value) {
    _prefs.setString('_DateProchDeblocage', value.toString());
  }

  static void setNbrAnomalie(String value) {
    _prefs.setString('_NbrAnomalie', value);
  }

  static void setNbrAbsence(int value) {
    _prefs.setInt('_NbrAbsence', value);
  }

  static DateTime getDateProchFermeture() {
    final dateString = _prefs.getString('_DateProchFermeture');
    if (dateString != null && dateString.isNotEmpty) {
      return DateTime.parse(dateString);
    }
    return DateTime(0);
  }

  static DateTime getDateProchOuverture() {
    final dateString = _prefs.getString('_DateProchOuverture');
    if (dateString != null && dateString.isNotEmpty) {
      return DateTime.parse(dateString);
    }
    return DateTime(0);
  }

  static DateTime getDateProchDeblocage() {
    final dateString = _prefs.getString('_DateProchDeblocage');
    if (dateString != null && dateString.isNotEmpty) {
      return DateTime.parse(dateString);
    }
    return DateTime(0);
  }

  static String getNbrAnomalie() {
    return _prefs.getString('_NbrAnomalie') ?? '';
  }

  static int getNbrAbsence() {
    return _prefs.getInt('_NbrAbsence') ?? 0;
  }
}
