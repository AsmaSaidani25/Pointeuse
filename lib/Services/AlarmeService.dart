/*
import 'package:pointeuse/Model/alarme.model.dart';

class AlarmeService {
  late Observable<List<AlarmeModel>> alarms;

  Stream<DateTime> get clock => dateService.clock;

  AlarmeService(Store<fromRoot.State> store, DateService dateService) {
    alarms = store.select((state) => fromRoot.getAlarms(state));

    Rx.combineLatest2(alarms, clock,
        (List<AlarmeModel> alarms, DateTime clockTime) {
      return checkAlarm(alarms, clockTime);
    }).listen((alarm) {
      if (alarm != null) {
        executeMethod(alarm);
      }
    });
  }

  void setTimer(String id, DateTime dateTime, Function() methodName) {
    store.dispatch(fromAlarmActions.RemoveAlarm(id));
    store.dispatch(fromAlarmActions.AddAlarm(
      idFront: id,
      dateTime: dateTime,
      status: true,
      methodName: methodName,
    ));
  }

  AlarmeModel? checkAlarm(List<AlarmeModel> alarms, DateTime clockTime) {
    for (final alarm in alarms) {
      if (alarm.dateTime.isBefore(clockTime) && alarm.status) {
        return alarm;
      }
    }

    return null;
  }

  void executeMethod(AlarmeModel alarm) {
    alarm.methodName();
    store.dispatch(fromAlarmActions.RemoveAlarm(alarm.idFront));
  }
}
*/
