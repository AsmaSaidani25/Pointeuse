import '../employee.model.dart';
import '../pointage.model.dart';
import '../shift.model.dart';

class EmployePointeuseDTO {
  List<EmployeeModel> employeeList;
  List<PointageModel> pointageList;
  List<ShiftModel> shiftList;

  EmployePointeuseDTO({
    required this.employeeList,
    required this.pointageList,
    required this.shiftList,
  });

  factory EmployePointeuseDTO.fromJson(Map<String, dynamic> json) {
    final List<dynamic> employeeData = json['employeeList'] ?? [];
    final List<dynamic> pointageData = json['pointageList'] ?? [];
    final List<dynamic> shiftData = json['shiftList'] ?? [];

    final List<EmployeeModel> employees =
        employeeData.map((e) => EmployeeModel.fromJson(e)).toList();
    final List<PointageModel> pointages =
        pointageData.map((e) => PointageModel.fromJson(e)).toList();
    final List<ShiftModel> shifts =
        shiftData.map((e) => ShiftModel.fromJson(e)).toList();

    return EmployePointeuseDTO(
      employeeList: employees,
      pointageList: pointages,
      shiftList: shifts,
    );
  }
}
