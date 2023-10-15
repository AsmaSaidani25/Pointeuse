import 'package:http/http.dart' as http;
import 'package:pointeuse/Model/employee.model.dart';
import 'package:pointeuse/Services/path.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'GenericCRUDRestService.dart';
import 'Session.service.dart';
import 'authentification.service.dart';
import 'package:http/http.dart' as http;

import 'dateService.dart';

class EmployeeService extends GenericCRUDRestService<EmployeeModel, String> {
  final List<int> ListIdEmployees;
  final SharedPreferences sharedPreferences;

  EmployeeService(
    PathService pathService,
    http.Client httpClient,
    SessionService sessionService,
    DateService dateHelperService,
  )   : ListIdEmployees = <int>[],
        sharedPreferences =
            SharedPreferences.getInstance() as SharedPreferences;

  Future<void> saveEmployeeIds(List<int> employeeIds) async {
    final stringList = employeeIds.map((id) => id.toString()).toList();
    await sharedPreferences.setStringList('employeeIds', stringList);
  }

  Future<List<int>> getSavedEmployeeIds() async {
    final stringList = sharedPreferences.getStringList('employeeIds');
    return stringList?.map((idStr) => int.parse(idStr))?.toList() ?? [];
  }

  Future<http.Response> getEmployeActifAndAbsenceByIdWithRestaurant(
      int idRestaurant) async {
    final dateJournee = SessionService.getDateJournee();
    final newDate = DateTime.parse(dateJournee);
    final initializedDate = DateTime(newDate.year, newDate.month,
        int.parse(dateJournee.substring(8)), 0, 0, 0);
    final uuidRestaurant = SessionService.uuidGenerator(idRestaurant);
    final dateChoisit = DateService.formatDateToScoreDelimiter(initializedDate);
    final response = await http.get(Uri.parse(
        'https://qa.myrhis.fr/employeActifAndAbsencePointeuse/$uuidRestaurant/$dateChoisit'));
    return response;
  }

  Future<http.Response>
      getEmployePreteActifAndShiftAndPointageByIdRestaurantAndDateJournee(
          int idRestaurant) async {
    final uuidRestaurant = SessionService.uuidGenerator(idRestaurant);
    final dateChoisit = DateService.formatDateToScoreDelimiter(
        DateTime.parse(SessionService.getDateJournee()));
    final response = await http.get(Uri.parse(
        'https://qa.myrhis.fr/employePreteActifAndAbsenceForPointeuse/$uuidRestaurant/$dateChoisit'));
    return response;
  }
}
