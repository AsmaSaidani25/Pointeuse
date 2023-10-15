class app_config {
  static final String hostServerPointeuse = "http://127.0.0.1:8080";
  static final String hostLocalServer = "http://127.0.0.1:7075";
  static final String hostServerGdh = "http://127.0.0.1:2006";
  static final String hostServerSecurity = "http://127.0.0.1:2005";
  static final String hostServerEmployee = "http://127.0.0.1:2003";
  static final String hostServerPlanning = "http://127.0.0.1:2004";
  static final String hostServerRapport = "http://127.0.0.1:2007";
  static final String pointageQueue = "/amq/queue/listPointage";
  static final String correctionQueue = "/amq/queue/listCorrectionPointage";
  static final String title = "2.6.0";
  static final String elkUrl = "http://elk-pointeuse.myrhis.fr:9200";
  static final String elasticSearchUsername = "frontPointeuse";
  static final String elasticSearchPassword = "o#:M45)=.=zS!";
  static final int delayMsBetweenhealthRequests = 60000;
  static final bool enableMonitoring = true;
  static final Map<String, dynamic> rabbitMQ = {
    "brokerURL": "wss://qa-rabbitmq.myrhis.fr:15674/ws",
    "connectHeaders": {
      "login": "pointeuseqa",
      "passcode": "DfgZp3MSpsdLk3WA",
    },
  };
}
