import 'package:flutter/material.dart';
import 'package:pointeuse/Model/alarme.model.dart';
import 'package:provider/provider.dart';

class AlarmProvider extends ChangeNotifier {
  final List<AlarmModel> _alarms = [];

  List<AlarmModel> get alarms => _alarms;
  static void setAlarm(AlarmProvider provider, String id, DateTime dateTime,
      Function() methodName) {
    provider._alarms.removeWhere((alarm) => alarm.idFront == id);
    provider._alarms.add(AlarmModel(
        idFront: id, dateTime: dateTime, status: true, methodName: methodName));
    provider.notifyListeners();
  }

  void removeAlarm(String id) {
    _alarms.removeWhere((alarm) => alarm.idFront == id);
    notifyListeners();
  }
}
