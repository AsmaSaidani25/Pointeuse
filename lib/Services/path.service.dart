class PathService {
  late String hostServerPointeuse;
  late String hostLocalServer;
  late String elkUrl;
  late int delayMsBetweenhealthRequests;
  late bool enableMonitoring;
  late String elasticSearchUsername;
  late String elasticSearchPassword;
  late String hostServerGdh;
  late String hostServerEmployee;
  late String hostServerPlanning;
  late String hostServerSecurity;
  late String hostServerRapport;
  late Map<String, dynamic> rabbitMQ;
  late Map<String, dynamic> _rabbitMQ;
  late String pointageQueue;
  late String correctionQueue;

  Map<String, dynamic> get rabbitMQConf {
    return _rabbitMQ;
  }

  set rabbitMQConf(Map<String, dynamic> value) {
    _rabbitMQ = value;
  }

  Map<String, dynamic> getRabbitMQ() {
    return rabbitMQ;
  }

  setRabbitMQ(Map<String, dynamic> value) {
    rabbitMQ = value;
  }

  String getSychroPointageQueue() {
    return pointageQueue;
  }

  setSychroPointageQueue(String value) {
    pointageQueue = value;
  }

  String getSychroCorrectionQueue() {
    return correctionQueue;
  }

  setSychroCorrectionQueue(String value) {
    correctionQueue = value;
  }

  String getHostServerSecurity() {
    return hostServerSecurity;
  }

  void setHostServerSecurity(String value) {
    hostServerSecurity = value;
  }

  String getHostServerRapport() {
    return hostServerRapport;
  }

  void setHostServerRapport(String value) {
    hostServerRapport = value;
  }

  String getPathPointeuse() {
    return hostServerPointeuse;
  }

  String getPathPlanning() {
    return hostServerPlanning;
  }

  void setPathPlanning(String value) {
    hostServerPlanning = value;
  }

  String getPathgdh() {
    return hostServerGdh;
  }

  void setPathgdh(String value) {
    hostServerGdh = value;
  }

  String getPathEmployee() {
    return hostServerEmployee;
  }

  void setPathEmployee(String value) {
    hostServerEmployee = value;
  }

  String getPathLocalServer() {
    return hostLocalServer;
  }

  void setPathLocalServer(String value) {
    hostLocalServer = value;
  }

  void setPathPointeuse(String value) {
    hostServerPointeuse = value;
  }

  String getPathELKServer() {
    return elkUrl;
  }

  void setPathELKServer(String value) {
    elkUrl = value;
  }

  int getdelayMsBetweenhealthRequests() {
    return delayMsBetweenhealthRequests;
  }

  void setdelayMsBetweenhealthRequests(int delay) {
    delayMsBetweenhealthRequests = delay;
  }

  bool getenableMonitoring() {
    return enableMonitoring;
  }

  void setenableMonitoring(bool value) {
    enableMonitoring = value;
  }

  String getElasticSearchUsername() {
    return elasticSearchUsername;
  }

  void setElasticSearchUsername(String value) {
    elasticSearchUsername = value;
  }

  String getElasticSearchPassword() {
    return elasticSearchPassword;
  }

  void setElasticSearchPassword(String value) {
    elasticSearchPassword = value;
  }
}
