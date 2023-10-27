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
    return stringList?.map((idStr) => int.parse(idStr)).toList() ?? [];
  }

  static Future<http.Response> getEmployeActifAndAbsenceByIdWithRestaurant(
      String idRestaurant) async {
    final dateJournee = await SessionService.getDateJournee();

    if (dateJournee == null) {
      // Handle the case where dateJournee is null
      throw Exception('DateJournee is null');
    }

    final newDate = DateTime.parse(dateJournee);
    final initializedDate =
        DateTime(newDate.year, newDate.month, newDate.day, 0, 0, 0);

    final uuidRestaurant = SessionService.uuidGenerator(idRestaurant);
    final dateChoisit = DateService.formatDateToScoreDelimiter(initializedDate);

    if (uuidRestaurant == null || dateChoisit == null) {
      // Handle the case where uuidRestaurant or dateChoisit is null
      throw Exception('UUID or Date is null');
    }

    final response = await http.get(Uri.parse(
        'https://qa.myrhis.fr/employeActifAndAbsencePointeuse/$uuidRestaurant/$dateChoisit'));
    return response;
  }

  static Future<http.Response>
      getEmployePreteActifAndShiftAndPointageByIdRestaurantAndDateJournee(
          String idRestaurant) async {
    final uuidRestaurant = SessionService.uuidGenerator(idRestaurant);
    final dateChoisit = DateService.formatDateToScoreDelimiter(
        DateTime.parse(await SessionService.getDateJournee()));
    final response = await http.get(Uri.parse(
        'https://qa.myrhis.fr/employePreteActifAndAbsenceForPointeuse/$uuidRestaurant/$dateChoisit'));
    return response;
  }
}
