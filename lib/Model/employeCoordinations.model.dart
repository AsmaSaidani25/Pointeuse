import 'employee.model.dart';
import 'pointage.model.dart';
import 'shift.model.dart';

class EmployeeCoordinations {
  EmployeeModel? employee;
  List<PointageModel>? pointages;
  List<ShiftModel>? shifts;
  PointageModel? pointageToUpdate;
  bool? isCurrent;

  // EmployeeCoordinations(
  //     EmployeeModel employee, List<PointageModel> pointages, bool isCurrent) {
  //   this.employee = employee;
  //   this.pointages = pointages;
  //   this.isCurrent = isCurrent;
  // }
}
