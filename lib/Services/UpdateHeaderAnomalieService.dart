import 'dart:async';
import 'package:pointeuse/Model/anomalie.model.dart';

class UpdateHeaderAnomalieService {
  static final StreamController<List<AnomalieModel>>
      _listGuiAnomalieController = StreamController<List<AnomalieModel>>();
  Stream<List<AnomalieModel>> get listGuiAnomalie =>
      _listGuiAnomalieController.stream;

  static void setListGuiAnomalie(List<AnomalieModel> listGuiAnomalie) {
    _listGuiAnomalieController.add(listGuiAnomalie);
  }

  void dispose() {
    _listGuiAnomalieController.close();
  }
}
