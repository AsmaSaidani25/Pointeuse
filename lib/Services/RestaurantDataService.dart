import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:pointeuse/Model/CorrectionPointage.dart';
import 'package:pointeuse/Model/anomalie.model.dart';
import 'package:pointeuse/Model/decoupage.horaire.model.dart';
import 'package:pointeuse/Model/employee.model.dart';
import 'package:pointeuse/Model/enumeration/NameOfTable.enum.dart';
import 'package:pointeuse/Model/enumeration/entity-action.enum.dart';
import 'package:pointeuse/Model/enumeration/pointage-time.enum.dart';
import 'package:pointeuse/Model/gui/EmployeePointeuseDTO.dart';
import 'package:pointeuse/Model/message.model.dart';
import 'package:pointeuse/Model/parametre.model.dart';
import 'package:pointeuse/Model/pointage.model.dart';
import 'package:pointeuse/Model/restaurant.model.dart';
import 'package:pointeuse/Model/shift.model.dart';
import 'package:pointeuse/Model/type.pointage.model.dart';
import 'package:pointeuse/Services/AnomalieService.dart';
import 'package:pointeuse/Services/ContrainteSocialeService.dart';
import 'package:pointeuse/Services/JsStoreServices/type-pointage-js-store.service.dart';
import 'package:pointeuse/Services/PlanningService.dart';
import 'package:pointeuse/Services/Session.service.dart';
import 'package:pointeuse/Services/UpdateHeaderAnomalieService.dart';
import 'package:pointeuse/Services/dateService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pointeuse/DatabaseHandler/DatabaseHelper.dart';
import 'AlarmProvider.dart';
import 'DecoupageHoraireService.dart';
import 'EmployeeService.dart';
import 'JsStoreServices/AnomalieJsStoreService.dart';
import 'JsStoreServices/CorrectionPointageJsStoreService.dart';
import 'JsStoreServices/EmployeJsStoreService.dart';
import 'JsStoreServices/MessageJsStoreService.dart';
import 'JsStoreServices/ParametreJsStoreService.dart';
import 'JsStoreServices/PlanningJsStoreService.dart';
import 'JsStoreServices/ShiftJsStoreService.dart';
import 'JsStoreServices/decoupageHoraireJsStore.service.dart';
import 'JsStoreServices/infoRestaurantJsStore.service.dart';
import 'MessageService.dart';
import 'NotificationService.dart';
import 'OnlineService.dart';
import 'ParametreService.dart';
import 'PointingService.dart';
import 'RestaurantService.dart';
import 'Session.service.dart';
import 'ShiftService.dart';
import 'TypePointageService.dart';
import 'dateService.dart';

class RestaurantDataService {
  SharedPreferences sharedPreferences;
  final ShiftService shiftService;
  final EmployeeService employeeService;
  final DecoupageHoraireService decoupageHoraireService;
  final SessionService sessionService;
  final AnomalieService anomalieService;
  final UpdateHeaderAnomalieService updateHeaderAnomalieService;
  final DateService dateService;
  final MessageService messageService;
  final ShiftJsStoreService shiftJsStoreService;
  final DecoupageHoraireJsStoreService decoupageHoraireJsStoreService;
  final EmployeJsStoreService employeJsStoreService;
  final InfoRestaurantJsStoreService infoRestaurantJsStoreService;
  final MessageJsStoreService messageJsStoreService;
  final TypePointageJsStoreService typePointageJsStoreService;
  final RestaurantService restaurantService;

  // final CheckingSocialConstraintsRegularlyService checkingSocialConstraintsRegularlyService;
  final DateService dateHelperService;
  final ContrainteSocialeService contrainteSocialeService;
  final OnlineService onlineService;
  static final listDecoupageHoraire = <dynamic>[];
  final listMessage = <dynamic>[];
  final listShift = <dynamic>[];
  static final listPointage = <dynamic>[];
  static final listAnomalie = <AnomalieModel>[];
  static late var listPointageFromIndexDb = <PointageModel>[];
  final ONE_DAY_AS_MILLISECONDS = 86400000;
  static final param = 'CORRECTPRNAUTO';
  final paramMode24 = 'MODE_24H';
  final paramPret = 'PRET_SALARIE';
  static late var paramatere = <ParametreModel>[];
  final pretedEmployeeIdList = <int>[];

  // bool isOnline = true;
  final tableNameEmployee = NameOfTable.EMPLOYEE;
  final tableNameShift = NameOfTable.SHIFT;
  static final tableNamePointage = NameOfTable.POINTAGE;
  static late int idRestaurant;
  static String? codeRestaurant = '';
  final DatabaseHelper databaseHelper;

  RestaurantDataService(
    this.employeeService,
    this.decoupageHoraireService,
    this.shiftService,
    this.sessionService,
    this.anomalieService,
    this.updateHeaderAnomalieService,
    this.messageService,
    this.shiftJsStoreService,
    this.decoupageHoraireJsStoreService,
    this.employeJsStoreService,
    this.infoRestaurantJsStoreService,
    this.messageJsStoreService,
    this.typePointageJsStoreService,
    this.restaurantService,
    //this.checkingSocialConstraintsRegularlyService,
    this.dateService,
    this.dateHelperService,
    this.contrainteSocialeService,
    this.onlineService,
    // this.idRestaurant,
    this.sharedPreferences,
    this.databaseHelper,
  ) {}

  static String makeString() {
    String outString = '';
    const inOptions = 'abcdefghijklmnopqrstuvwxyz0123456789';
    for (int i = 0; i < 32; i++) {
      outString += inOptions[Random().nextInt(inOptions.length)];
    }
    return outString;
  }

  static Future<void> savePretedEmployeeIds(List<int> employeeIds) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final stringList = employeeIds.map((id) => id.toString()).toList();
    await sharedPreferences.setStringList('pretedEmployeeIds', stringList);
  }

  static Future<void> getEmployeePreteAndSaveToLocalBase(
      EmployePointeuseDTO employeeDto, String idRestaurant) async {
    await EmployeJsStoreService.deleteEmployeePrete(
        NameOfTable.EMPLOYEE, idRestaurant);
    final pretedEmployeeIdList = <int>[];

    for (var i = 0; i < employeeDto.employeeList.length; i++) {
      pretedEmployeeIdList.add(employeeDto.employeeList[i].idEmployee);
      employeeDto.employeeList[i].idFront = makeString();

      // Assuming employeJsStoreService.addEmployee is an async method
      await EmployeJsStoreService.addEmployee(employeeDto.employeeList[i]);
    }

    // Save pretedEmployeeIdList to SharedPreferences
    await savePretedEmployeeIds(pretedEmployeeIdList);
  }

  static Future<void> getPointagesPretsAndSaveToLocalBase(
      employeeDto, String idRestaurant) async {
    final List<Map<String, dynamic>> pointageList = employeeDto.pointageList;

    final prefs = await SharedPreferences.getInstance();

    // Delete existing pointages associated with the pretedEmployeeIdList
    final pretedEmployeeIdList = prefs.getStringList('pretedEmployeeIdList');
    if (pretedEmployeeIdList != null) {
      await PlaningJsStoreService.deletePlanningPreteByEmployees(
          tableNamePointage, pretedEmployeeIdList.map(int.parse).toList());
    }

    if (pointageList.isNotEmpty) {
      for (final pointageData in pointageList) {
        final PointageModel pointage = PointageModel(
          idEmployee: pointageData['idEmployee'],
          idShift: pointageData['idShift'],
          idFront: makeString(),
          dateJournee: pointageData['dateJournee'],
          heureDebut: pointageData['heureDebut'],
          heureDebutIsNight: pointageData['heureDebutIsNight'],
          heureFin: pointageData['heureFin'],
          heureFinIsNight: pointageData['heureFinIsNight'],
          idTypePointageRef: pointageData['idTypePointageRef'],
          // Add other properties and their values here
        );

        final dateDebut = DateService.createDateFromHourAndNightValue(
          DateTime.parse(
              '${pointageData['dateJournee']} ${pointageData['heureDebut']}'),
          pointageData['heureDebutIsNight'],
        );

        final dateFin = DateService.createDateFromHourAndNightValue(
          DateTime.parse(
              '${pointageData['dateJournee']} ${pointageData['heureFin']}'),
          pointageData['heureFinIsNight'],
        );

        pointage.tempsPointes =
            DateService.getDiffInMinutes(dateFin, dateDebut);

        if (pointageData['idShift'] == 0) {
          pointage.idShift = null;
        }

        final typePointageService = TypePointageJsStoreService();

        final typePointageRef = await TypePointageJsStoreService.getOneById(
            pointageData['typePointageRef']['id']);
        pointage.typePointageRef = typePointageRef as TypePointageModel?;

        await PlaningJsStoreService.addPointage(pointage);
        listPointage.add(pointage);
      }
    }
  }

  static Future<Database> _initializeDatabase() async {
    // Replace with your database initialization logic here
    final dbPath = await getDatabasesPath();
    final databasePath = join(dbPath, '_database.db');

    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        // Define your table creation logic here
        db.execute(
          'CREATE TABLE IF NOT EXISTS ('
          // Define your table columns here
          ')',
        );
      },
      version: 1,
    );

    return database;
  }

  static Future<void> getShiftPretAndSaveToLocalBase(
      employeeDto, String idRestaurant) async {
    // Define your table name and other variables here
    String tableNameShift = "your_table_name";

    await EmployeJsStoreService.deleteEmployeePrete(
        tableNameShift, idRestaurant);

    final Database database = await _initializeDatabase();

    final List<Map<String, dynamic>>? shiftsData =
        await ShiftJsStoreService.getShiftList();

    if (employeeDto['shiftList'].isNotEmpty) {
      for (var item in employeeDto['shiftList']) {
        final ShiftModel shift = ShiftModel.fromJson(item);

        // Convert the ShiftModel to a Map<String, dynamic>
        final shiftMap = shift.toMap();

        final indexShift =
            shiftsData!.indexWhere((map) => map['shiftId'] == shift.idShift);

        if (indexShift == -1) {
          // Shift doesn't exist in shiftsData, add it
          shiftMap['idFront'] = makeString();
          await ShiftJsStoreService.addShift(shiftMap);
        }
      }
    }
  }

  static Future<void> getEmployePreteActifAndShiftAndPointage(
      String idRestaurant) async {
    // Set employee prete in indexedDB
    EmployePointeuseDTO employeesDto = EmployePointeuseDTO(
        pointageList: [],
        employeeList: [],
        shiftList: []); // Initialize with default values
    try {
      final response = await EmployeeService
          .getEmployePreteActifAndShiftAndPointageByIdRestaurantAndDateJournee(
              idRestaurant);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        employeesDto = EmployePointeuseDTO.fromJson(jsonData);
      } else {
        throw Exception('Failed to fetch data');
      }
      SessionService.setSyncPretsProgress(true);
    } catch (err) {
      SessionService.setSyncPretsProgress(false);
      print(err);
    }

    if (employeesDto.employeeList != null &&
        employeesDto.employeeList.isNotEmpty) {
      await getEmployeePreteAndSaveToLocalBase(employeesDto, idRestaurant);
      await getPointagesPretsAndSaveToLocalBase(employeesDto, idRestaurant);
      await getShiftPretAndSaveToLocalBase(employeesDto, idRestaurant);
    }
  }

  static Future<void> synchronisePrametre() async {
    List<ParametreModel> parametres =
        await ParametreJsStoreService.getListParameter();
    ParametreService parametreService =
        ParametreService(); // Create an instance
    String? restaurantId = (await SessionService.getIdRestaurant()) as String?;
    if (restaurantId != null) {
      await parametreService.updateParamsByRestaurant(parametres, restaurantId);
    } else {
      // Handle the case where the restaurantId is null
    }
  }

  static Future<void> getParametreByparam() async {
    await synchronisePrametre();
  }

  static Future<void> synchronisePointage(String dateJournee) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Assuming PointageModel is a class representing your data
    List<PointageModel> pointages = await PointingService.getDailyPointages(
        prefs.getString('dateJournee') ?? '');
    String dateChoisit = prefs.getString('dateChoisit') ?? '';
    // Publish PointageClosePointeuse
//    await synchronisationService.publishPointageClosePointeuse(pointages, dateJournee);
    // Delete all pointages before two months
    await PlaningJsStoreService.deleteAllPointageBefore2Months();
  }

  static Future<void> verifyExitPointing(
      DateTime dateFinActivity, bool isNight, String dateJournee) async {
    for (int i = 0; i < listPointageFromIndexDb.length; i++) {
      if (listPointageFromIndexDb[i].heureFin == null) {
        await updateOrDeletePointage(
            listPointageFromIndexDb[i], dateFinActivity, isNight, dateJournee);
      }
    }
    await synchronisePointage(dateJournee);
  }

  static Future<void> getListPointage(
      DateTime dateFinActivity, bool isNight, String dateJournee) async {
    listPointageFromIndexDb =
        await PointingService.getDailyPointages(dateJournee);
    await verifyExitPointing(dateFinActivity, isNight, dateJournee);
  }

  static Future<void> updatePointing(
      DateTime dateFinActivity, bool isNight, String dateJournee) async {
    paramatere = await ParametreJsStoreService.getParamatreByParam(param)
        as List<ParametreModel>; // Removed unnecessary await
    await getListPointage(dateFinActivity, isNight, dateJournee);
  }

  static Future<void> addCorrectionPointage(PointageModel pointage,
      EntityAction entityAction, String dateJournee) async {
    final employee = await EmployeJsStoreService.getEmployesByIdEmployee(
        pointage.idEmployee);
    final correctionPointage = CorrectionPointageModel();

    correctionPointage.entityAction =
        EntityAction.values[entityAction.index] as String?;
    correctionPointage.dateModification = DateTime.now();
    correctionPointage.nomEmployee = employee.nom;
    correctionPointage.prenomEmployee = employee.prenom;
    correctionPointage.idEmployee = pointage.idEmployee;
    correctionPointage.nomManager = null;
    correctionPointage.prenomManager = null;
    correctionPointage.idManager = 0;
    correctionPointage.idRestaurant = SessionService.getIdRestaurant as int?;
    correctionPointage.idFront = makeString();

    if (employee.badge != null) {
      correctionPointage.employeeCodeBadge = employee.badge!.code;
    }

    if (entityAction == EntityAction.MODIFICATION) {
      // set old hours
      correctionPointage.oldValue = null;
      correctionPointage.oldValueIsNight = false;
      correctionPointage.pointageTime =
          PointageTime.values[PointageTime.EXIT.index] as String?;
      // set updated hours
      correctionPointage.newValue = pointage.heureFin;
      correctionPointage.newValueIsNight = pointage.heureFinIsNight;
    } else if (entityAction == EntityAction.DELETION) {
      // set old hours
      correctionPointage.oldValue = pointage.heureDebut;
      correctionPointage.oldValueIsNight = pointage.heureDebutIsNight;
      correctionPointage.pointageTime =
          PointageTime.values[PointageTime.ENTER_EXIT.index] as String?;
    }

    correctionPointage.pointageIdFront = pointage.idFront;
    correctionPointage.dayOfActivity = dateJournee;

    await CorrectionPointageService.addCorrection(correctionPointage);
  }

  static Future<void> updateOrDeletePointage(PointageModel pointage,
      DateTime dateFinActivity, bool isNight, String dateJournee) async {
    final paramatere = await ParametreJsStoreService.getParamatreByParam(param);
    final dateInterval = DateInterval(
      dateJournee: pointage.dateJournee,
      heureDebut: pointage.heureDebut,
      heureDebutIsNight: pointage.heureDebutIsNight,
      heureFin: pointage.heureFin,
      heureFinIsNight: pointage.heureFinIsNight,
    );
    if (paramatere.isNotEmpty) {
      final valeur =
          paramatere[0].valeur.toString(); // Explicitly cast to string

      if (valeur == '1') {
        pointage.heureFin = DateService.createDatePlusHHmmTime(
            DateService.setTimeFormatHHMM(
                DateService.getHHmmformatFromDateAndWithSeparator(
                    dateFinActivity, ':')),
            '0');
        pointage.heureFin =
            DateService.substractMinuteToDate(pointage.heureFin, 1);
        pointage.heureFin = DateService.getHHmmformatFromDateAndWithSeparator(
            pointage.heureFin, ':');

        DateTime datFin = DateService.createDatePlusHHmmTime(
            DateService.setTimeFormatHHMM(
                DateService.getHHmmformatFromDateAndWithSeparator(
                    dateFinActivity, ':')),
            '0');

        pointage.heureFinIsNight = await ContrainteSocialeService.checkIsNight(
            DateTime(datFin.year, datFin.month, datFin.day, datFin.hour,
                datFin.minute - 1),
            DateService.getCorrectDateJournee());

        pointage.tempsPointes = DateService.getTotalMinutes(dateInterval);
        pointage.modified = 2;

        await PointingService.updatePointage(pointage);
        await RestaurantDataService.addCorrectionPointage(
            pointage, EntityAction.MODIFICATION, dateJournee);
      } else if (valeur == '0') {
        await PointingService.deletePointage(pointage.idFront);
        await addCorrectionPointage(
            pointage, EntityAction.DELETION, dateJournee);
      }
    }
  }

  static Future<void> setDateJourneeAndOuvertureFermetureTimer() async {
    DateTime currentDate = DateTime.now();
    DecoupageHoraireModel currentDayDecoupage = DecoupageHoraireModel(
      idDecoupageHoraire: 1,
      valeurDimancheIsNight: true,
      valeurDimancheIsNew: false,
      idFront: 'someId',
      valeurLundiIsNight: true,
      valeurLundiIsNew: false,
      valeurMardiIsNight: true,
      valeurMardiIsNew: false,
      valeurMercrediIsNight: true,
      valeurMercrediIsNew: false,
      valeurJeudiIsNight: true,
      valeurJeudiIsNew: false,
      valeurVendrediIsNight: true,
      valeurVendrediIsNew: false,
      valeurSamediIsNight: true,
      valeurSamediIsNew: false,
      hasCorrectValue: true,
      isVisited: true,
      canDelete: true,
      // Provide a value for canDelete
      phaseLibelle: 'somePhase',
      debut: DateTime.now(),
      // Provide a DateTime value for debut
      fin: DateTime.now(), // Provide a DateTime value for fin
    );
    currentDayDecoupage.debut = currentDayDecoupage.fin = currentDate =
        currentDate.subtract(Duration(
            seconds: currentDate.second,
            milliseconds: currentDate.millisecond));
    final Duration ONE_DAY_AS_DURATION = Duration(days: 1);
    final DateTime previousDate = currentDate.subtract(ONE_DAY_AS_DURATION);
    final DateTime nextDate = currentDate.add(ONE_DAY_AS_DURATION);
    final database = await DatabaseHelper.getDatabase();

    final JourSemaine currentDay =
        DateService.getJourSemaine(currentDate) as JourSemaine;
    final JourSemaine previousDay =
        DateService.getJourSemaine(previousDate) as JourSemaine;
    final JourSemaine nextDay =
        DateService.getJourSemaine(nextDate) as JourSemaine;
    final JourSemaine afterNextDay =
        DateService.getJourSemaine(nextDate.add(ONE_DAY_AS_DURATION))
            as JourSemaine;
    final dbService = DecoupageHoraireJsStoreService(database);

    final List<DecoupageHoraireModel>? listDecoupageHoraire =
        await dbService.getListDecoupage();

    // DJA = Debut Journee Activite
    final DecoupageHoraireModel debutJournee =
        listDecoupageHoraire!.firstWhere((item) => item.phaseLibelle == 'DJA');

    // FJA = Fin Journee Activite
    final DecoupageHoraireModel finJournee =
        listDecoupageHoraire.firstWhere((item) => item.phaseLibelle == 'FJA');

    currentDayDecoupage = DateService.createDateFromDecoupageValues(
            currentDay.toString(), 0, debutJournee, finJournee)
        as DecoupageHoraireModel;
    final previousDayDecoupage = DateService.createDateFromDecoupageValues(
        previousDay.toString(), -1, debutJournee, finJournee);
    final nextDayDecoupage = DateService.createDateFromDecoupageValues(
        nextDay.toString(), 1, debutJournee, finJournee);
    final afterNextDayDecoupage = DateService.createDateFromDecoupageValues(
        afterNextDay.toString(), 2, debutJournee, finJournee);
    if (currentDate.isAfter(currentDayDecoupage.debut) &&
        currentDate.isBefore(currentDayDecoupage.fin)) {
      await SessionService.setDateJournee(currentDate);
      await SessionService.setJournee(currentDay.toString());
      SessionService.setDebutJournee(currentDayDecoupage.debut);
      SessionService.setFinJournee(currentDayDecoupage.fin);
      final alarmProvider = AlarmProvider();
      AlarmProvider.setAlarm(
        alarmProvider,
        'fermetureAutomatiquePointese',
        currentDayDecoupage.fin,
        () async {
          final dateJournee =
              DateTime.parse(await SessionService.getDateJournee());
          await RestaurantDataService.updatePointing(
            currentDayDecoupage.fin,
            finJournee[
                'valeur${DateService.convertStringToCamelCase(currentDay.toString())}IsNight'],
            dateJournee.toString(), // Convert DateTime to String
          );
          await SessionService.setPointeuseState(false);
          // this.checkingSocialConstraintsRegularlyService.stopAudio();
          // this.checkingSocialConstraintsRegularlyService.stopPreAlarme();
          await RestaurantDataService.getParametreByparam();
        },
      );
      SessionService.setDateProchFermeture(currentDayDecoupage.fin);
    }
  }

  static Future<void> getDecopageHoraireAndSaveToLocalBase(
      String idRestaurant) async {
    final database = await DatabaseHelper.getDatabase();

    try {
      List<DecoupageHoraireModel>? data =
          await DecoupageHoraireService.getDecoupageHoraire(idRestaurant);
      DecoupageHoraireJsStoreService dbService =
          DecoupageHoraireJsStoreService(database);
      bool tableExists = await dbService.tableExists('decoupage');

      if (tableExists) {
        // Table exists, clear the data
        await dbService.clearData();
      }

      if (data.isNotEmpty) {
        for (var item in data) {
          item.idFront = makeString();
          dbService.addDecoupage(item);
          listDecoupageHoraire.add(item);
        }
        await setDateJourneeAndOuvertureFermetureTimer();
      } else {
        print('Data is empty.'); // Handle the case when data is null
        // You can show an error message or take appropriate action.
      }
    } catch (e) {
      // Handle exceptions here
      print('Error in getDecopageHoraireAndSaveToLocalBase: $e');
      // You can show an error message or handle the error as needed.
    }
  }

  static List<EmployeeModel> parseEmployeeData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<EmployeeModel>((json) => EmployeeModel.fromJson(json))
        .toList();
  }

  static Future<void> getEmployeeActifAndSaveToLocalBase(
      String idRestaurant) async {
    List<EmployeeModel> actifEmployees = [];
    List<EmployeeModel> employeesToSave = [];
    List<EmployeeModel> allEmployees =
        []; // Declare and initialize allEmployees

    try {
      final response =
          await EmployeeService.getEmployeActifAndAbsenceByIdWithRestaurant(
              idRestaurant);
      actifEmployees = parseEmployeeData(response.body);
      allEmployees = List.from(actifEmployees);

      SessionService.setSyncEmployesProgress(true);
      SessionService.setNbrTotEmp(allEmployees.length);

      int total = 0;
      for (EmployeeModel employee in actifEmployees) {
        total += employee.absenceConges.length;
      }
      SessionService.setNbrAbsence(total);
    } catch (error) {
      SessionService.setSyncEmployesProgress(false);
      print(error);
    }

    for (EmployeeModel employee in actifEmployees) {
      employee.idFront = makeString();
      employee.idRestaurant = idRestaurant;

      if (employee.badge == null) {
        final employeeList =
            await EmployeJsStoreService.getById(employee.idEmployee);
        final employeeFromStore =
            employeeList.isNotEmpty ? employeeList.first : null;

        if (employeeFromStore != null) {
          employee.badge = employeeFromStore.badge;
          employeesToSave.add(employee);
        }
      } else {
        employeesToSave.add(employee);
      }
    }

    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear(); // Clear the previous data
    for (EmployeeModel employee in employeesToSave) {
      await sharedPreferences.setString(
          employee.idFront!, jsonEncode(employee.toJson()));
    }
  }

  static Future<void> structureDataToDisplay(List<ShiftModel> listShift) async {
    List<EmployeeModel> allEmployees =
        await EmployeJsStoreService.getEmployesList();

    for (EmployeeModel employe in allEmployees) {
      employe.shifts = listShift
          .where((shift) =>
              shift.employee != null &&
              shift.employee!.idEmployee == employe.idEmployee)
          .toList();

      if (employe.shifts.isNotEmpty) {
        ContrainteSocialeService
            .verificationContraintMaxShiftWithoutBreakInListShift(employe);
      }
    }
  }

  List<ShiftModel> parseShiftData(String responseBody) {
    // Implement the logic to parse the response body and return a list of ShiftModel
    // Example: Assuming responseBody contains a JSON array of shifts
    final List<dynamic> jsonData = json.decode(responseBody);
    return jsonData.map((data) => ShiftModel.fromJson(data)).toList();
  }

  static Future<void> getShiftAndSaveToLocalBase(String idRestaurant) async {
    List<ShiftModel> shifts = [];
    double totalDuration = 0;

    try {
      final response =
          await ShiftService.getListShiftByIdRestaurant(idRestaurant);
      if (response != null && response.isNotEmpty) {
        shifts = response;
        structureDataToDisplay(shifts);
        SessionService.setSyncPlanningProgress(true);

        await ShiftJsStoreService.clearData();

        for (ShiftModel item in shifts) {
          if (item.acheval && item.modifiable) {
            item.heureFinCheval = item.heureFin;
            item.heureFin = DateService.getHHmmformatFromDateAndWithSeparator(
                SessionService.getDebutJournee(), ':');
            item.heureFinChevalIsNight = item.heureFinIsNight;
          } else if (item.acheval && !item.modifiable) {
            item.heureDebutCheval = item.heureDebut;
            item.heureDebut = DateService.getHHmmformatFromDateAndWithSeparator(
                SessionService.getDebutJournee(), ':');
            item.heureDebutChevalIsNight = false;
            item.heureFinIsNight = false;
          }
          item.idFront = makeString();
          item.idRestaurant = idRestaurant;
          Map<String, dynamic> shiftMap = item.toMap();
          ShiftJsStoreService.addShift(shiftMap);
          totalDuration += item.totalHeure;
        }

        double totalHours = totalDuration / 60;
        SessionService.setTotEmpPlaned(totalHours);
      }
    } catch (error) {
      SessionService.setSyncPlanningProgress(false);
      print(error);
    }
  }

  static Future<void> addAnomalie(List<AnomalieModel> anomalies) async {
    Database _db = await openDatabase('_database.db');

    if (anomalies.isNotEmpty) {
      for (var i = 0; i < anomalies.length; i++) {
        anomalies[i].idFront = makeString();
        anomalies[i].dateAnomalie =
            DateService.setTimeNull(anomalies[i].dateAnomalie);

        final addedAnomalies =
            await AnomalieJsStoreService.addAnomalie(anomalies[i], _db);
        listAnomalie.add(addedAnomalies[0]);
      }
    }
  }

  static Future<void> getListAnomalies(String idRestaurant) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<AnomalieModel>? anomalies =
        await AnomalieService.getAllAnomalieByRestaurant(idRestaurant);

    UpdateHeaderAnomalieService.setListGuiAnomalie(anomalies!);
    SessionService.setNbrAnomalie(anomalies.length.toString());

    // Convert anomalies to a list of JSON strings
    List<String> anomaliesJsonList = anomalies.map((anomalie) {
      Map<String, dynamic> anomalieMap = anomalie.toMap();
      return jsonEncode(anomalieMap);
    }).toList();

    // Save anomalies in SharedPreferences
    await prefs.setStringList('anomalies', anomaliesJsonList);

    // You might need to implement the addAnomalie function that takes the list of anomalies
    await addAnomalie(anomalies);
  }

  static Future<void> getMessagesAndSaveToLocalBase(String idRestaurant) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<MessageModel> messages =
        await MessageService.getMessagesByRestaurant(idRestaurant);

    List<MessageModel> storedMessages = [];
    if (prefs.containsKey('messages')) {
      final storedMessagesJson = prefs.getStringList('messages') ?? [];
      storedMessages = storedMessagesJson
          .map((json) => MessageModel.fromMap(jsonDecode(json)))
          .toList();
    }

    for (int i = 0; i < messages.length; i++) {
      if (!storedMessages
          .any((message) => message.idMessage == messages[i].idMessage)) {
        messages[i].idFront = makeString();
        storedMessages.add(messages[i]);
      }
    }

    List<String> storedMessagesJson =
        storedMessages.map((message) => jsonEncode(message.toMap())).toList();
    await prefs.setStringList('messages', storedMessagesJson);
  }

  static Future<void> getActiveTypesPointage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<TypePointageModel> typesPointage =
        await TypePointageService.getActiveTypePointage();

    List<TypePointageModel> storedTypesPointage = [];
    if (prefs.containsKey('typesPointage')) {
      final storedTypesPointageJson =
          prefs.getStringList('typesPointage') ?? [];
      storedTypesPointage = storedTypesPointageJson
          .map((json) => TypePointageModel.fromMap(jsonDecode(json)))
          .toList();
    }

    storedTypesPointage.clear(); // Clear existing stored data

    for (int i = 0; i < typesPointage.length; i++) {
      typesPointage[i].idFront = makeString();
      storedTypesPointage.add(typesPointage[i]);
    }

    List<String> storedTypesPointageJson = storedTypesPointage
        .map((typePointage) => jsonEncode(typePointage.toMap()))
        .toList();
    await prefs.setStringList('typesPointage', storedTypesPointageJson);
  }

  static Future<void> getParametreList(String idRestaurant) async {
    List<ParametreModel> parameters = [];

    await ParametreService.getAllParametreByIdRestaurat(idRestaurant)
        .then((result) {
      parameters = result;
      SessionService.setSyncParamProgress(true);

      /*  final paramSong = parameters.firstWhere(
          (paramete) => paramete.param == 'LANGUE_SONS',
          orElse: () => null);
      if (paramSong != null &&
          paramSong.valeur != langueStorageService.getVocalLanguageSettings()) {
        langueStorageService.setVocalLanguageSettings(paramSong.valeur);
      }*/
    });
  }

  static Future<void> getPointagesAndSaveToLocalBase(
      String idRestaurant) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int idRestaurant = '' as int;

    List<PointageModel> pointagesLocal =
        await PlaningJsStoreService.getListPointage();

    if (pointagesLocal.isEmpty) {
      List<PointageModel> backPointeusePointages =
          await PlanningService.getListPointageByIdRestaurant(
              idRestaurant as String);

      if (backPointeusePointages.isNotEmpty) {
        for (var backPointage in backPointeusePointages) {
          if (!listPointage
              .any((pointage) => pointage.idFront == backPointage.idFront)) {
            backPointage.idFront = makeString();
            if (!listPointage
                .any((pointage) => pointage.idFront == backPointage.idFront)) {
              backPointage.idFront = makeString();

              bool isNight = backPointage.heureDebutIsNight != null
                  ? backPointage.heureDebutIsNight
                  : false;
              DateTime dateDebut = DateService.createDateFromHourAndNightValue(
                DateTime.parse(
                    '${backPointage.dateJournee} ${backPointage.heureDebut}'),
                isNight,
              );
              bool isHeureFinNight = backPointage.heureFinIsNight;
              DateTime dateFin = DateService.createDateFromHourAndNightValue(
                DateTime.parse(
                    '${backPointage.dateJournee} ${backPointage.heureFin}'),
                isHeureFinNight,
              );
              backPointage.tempsPointes =
                  DateService.getDiffInMinutes(dateFin, dateDebut);
              if (backPointage.idShift == 0) {
                backPointage.idShift = null;
              }
              backPointage.typePointageRef =
                  await TypePointageJsStoreService.getOneById(
                      backPointage.idTypePointageRef) as TypePointageModel;
              backPointage.idRestaurant = idRestaurant;
              PlaningJsStoreService.addPointage(backPointage);
              listPointage.add(backPointage);
            }
          }
        }
      }
    }
  }

/*
  bool displaySpinner = false;
  bool displayModal = false;
  String codeRestaurant = '';
  //int idRestaurant = 0;
  bool clicked = false;*/

  Future<void> setIsAssociatedToFalse(int idRestaurant) async {
    final restaurantService =
        RestaurantService(); // Create an instance of the class
    await restaurantService.changeStatusRestaurant(idRestaurant).then((value1) {
      print(value1);
    });
  }

  static Future<bool> confirmAssociation(String codeRestaurant) async {
    bool value = await confirmAssociation(codeRestaurant);
    return value;
  }

  static Future<void> getInfoToPointeuse(String idRestaurant) async {
    PlaningJsStoreService instance = PlaningJsStoreService();
    var uuid = SessionService.uuidGenerator(idRestaurant);
    // await getTokenPointeuseFromV2();

    //4cbbe87d-941822116b0f-41a3-8
    await getDecopageHoraireAndSaveToLocalBase(uuid);
    await getEmployeeActifAndSaveToLocalBase(idRestaurant);
    await getShiftAndSaveToLocalBase(idRestaurant);
    await getListAnomalies(idRestaurant);
    await getMessagesAndSaveToLocalBase(idRestaurant);
    await getActiveTypesPointage();
    await getParametreList(idRestaurant);
    await getPointagesAndSaveToLocalBase(idRestaurant);
    await PlaningJsStoreService.deleteAllPointageBefore2Months();
    final paramPret = await ParametreJsStoreService.getParamatreByParam(param);

    if (paramPret.isNotEmpty && paramPret[0].valeur == 'true') {
      await getEmployePreteActifAndShiftAndPointage(idRestaurant);
    } else {
      await setDateJourneeAndOuvertureFermetureTimer();
    }
  }

  static Future<String> getBearerToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('bearerToken') ??
        ''; // Return an empty string if the token doesn't exist
  }

  static Future<void> getRestaurantByCodePointeuse(String codePointeuse) async {
    final token = await getBearerToken();
    final response = await http.get(
        Uri.parse(
            'https://qa.myrhis.fr/employee/restaurant/byCodePointeuse/$codePointeuse'),
        headers: {
          'Authorization':
              'Bearer_RH_IS eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpc21haWwubWFuc291cmlAcmhpcy1zb2x1dGlvbnMuY29tIiwiYXVkIjoiNDMyMCIsImlzcyI6ImV5SmhiR2NpT2lKSVV6STFOaUo5LmV5SnpkV0lpT2lKU1JVWlNSVk5JWDFSUFMwVk9JaXdpYVhOeklqb2lhWE50WVdsc0xtMWhibk52ZFhKcFFISm9hWE10YzI5c2RYUnBiMjV6TG1OdmJTSXNJbVY0Y0NJNk1UWTVPRFUyTnpnMk4zMC5qZWhTdDVfZ1FMN3g5X2dWV3hGamRWUU9EdTNtY1lOTkVpcllPWWduOHRNIiwiZXhwIjoxNjk4NTY3ODY3LCJhdXRob3JpdGllcyI6W119.ZEsz4Y917TGGfJZuMCKOU50fjEAzhB6OCwLqDJsBhqc',
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic>? restaurantData = json.decode(response.body);
      final restaurant = RestaurantModel.fromJson(restaurantData!);
      if (restaurant != null && restaurant.idRestaurant != null) {
        restaurant.idFront = makeString();
        idRestaurant = restaurant.idRestaurant!;
        InfoRestaurantJsStoreService.addRestaurant(restaurant);
        PointingService.restaurant = restaurant;

        await RestaurantDataService.getInfoToPointeuse(
            restaurant.idRestaurant.toString());
        SessionService.setIdRestaurant(restaurant.idRestaurant.toString());
        SessionService.setCodeRestaurant(codeRestaurant!);
        SessionService.setRestaurantName(restaurant.libelle);
        SessionService.setPointeuseState(true);
        NotificationService.showSuccessMessage('POINTEUSE.ASSOCIETED');

        final idTimeout = Timer(Duration(seconds: 2), () async {
          // if (!SessionService.getIsTechnicien()) {
          //  // displaySpinner = false;
          // }
          if (await confirmAssociation(codeRestaurant!)) {
            print('confirmed association');
          } else {
            print('denied association');
          }
          SessionService.setLastSync(DateTime.now().toString());
          SessionService.setEmploye(0);
        });

        await idTimeout;

        // You may need to use the `dart:html` package for web-based navigation
        // window.location.href = '/';
      }
    } else {
      print(response.body.toString());
    }
  }
/*  notificationService.showErrorMessage(
          rhisTranslateService.translate('POINTEUSE.ASSOCIATION_ERROR'));*/ /*
      clicked = false;
      displaySpinner = false;
      print(err);
    };*/

}
