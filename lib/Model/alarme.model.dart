class AlarmModel {
  final String idFront;
  final DateTime dateTime;
  final bool status;
  final Function() methodName;

  AlarmModel({
    required this.idFront,
    required this.dateTime,
    required this.status,
    required this.methodName,
  });
}
