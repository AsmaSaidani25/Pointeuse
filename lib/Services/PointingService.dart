import 'package:pointeuse/Model/enumeration/NameOfTable.enum.dart';
import 'package:pointeuse/Model/message.model.dart';
import 'package:pointeuse/Model/parametre.model.dart';
import 'package:pointeuse/Model/pointage.model.dart';
import 'package:pointeuse/Model/restaurant.model.dart';
import 'package:pointeuse/Model/shift.model.dart';
import 'package:pointeuse/Model/type.pointage.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'JsStoreServices/dbJsStore.service.dart';

class PointingService extends DbJsStoreService<PointageModel> {
  static Database? _database;

  static RestaurantModel? _restaurant;
  late var tableName = NameOfTable.POINTAGE;

  // Define a setter for restaurant
  static set restaurant(RestaurantModel? restaurant) {
    _restaurant = restaurant;
  }

  // Define a getter for restaurant if needed
  static RestaurantModel? get restaurant => _restaurant;

  static Future<Database> initializeDatabase() async {
    if (_database != null) return _database!;

    // Open the database (create if it doesn't exist)
    _database = await openDatabase(
      join(await getDatabasesPath(), '_database.db'),
      onCreate: (db, version) {
        // Create tables if they don't exist
        db.execute(
          'CREATE TABLE IF NOT EXISTS ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          // Define your table columns here
          ')',
        );
      },
      version: 1,
    );

    return _database!;
  }

  static Future<void> deletePointage(String idFront) async {
    await _database!.delete(
      NameOfTable.POINTAGE, // Replace with your actual table name
      where: 'idFront = ?',
      whereArgs: [idFront],
    );
  }

  static Future<List<PointageModel>> getDailyPointages(
      String dateJournee) async {
    final Database database =
        await initializeDatabase(); // Initialize your SQLite database

    final List<Map<String, dynamic>> result = await database.query(
      NameOfTable.POINTAGE, // Your table name
      where: 'dateJournee = ?',
      whereArgs: [dateJournee],
    );

    // Convert the result into a List<PointageModel>
    List<PointageModel> pointages = result.map((row) {
      return PointageModel.fromJson(
          row); // Assuming you have a fromJson constructor in PointageModel
    }).toList();

    return pointages;
  }

  static Future<int> updatePointage(PointageModel pointage) async {
    final database = await initializeDatabase();

    return await database.update(
      NameOfTable.POINTAGE,
      pointage.toMap(), // Convert PointageModel to a map
      where: 'idFront = ?',
      whereArgs: [pointage.idFront],
    );
  }

  bool isEnterPointing = false;
  PointageModel? lastPointing;
  RestaurantModel? restaurantInfos;
  Map<String, dynamic>?
      employeeInfos; // You may want to define a specific data structure here
  List<ParametreModel> listParameter = [];
  String planningUser = 'PLANNINGUSE';
  String minBeforPlan = 'MINBEFORPLAN';
  List<MessageModel> messages = [];
  ShiftModel? currentShift;
  bool decalage = false;
  //final BehaviorSubject<String> constraintMessage = BehaviorSubject<String>();
  //Stream<String> get currentMessage => constraintMessage.stream;
  String planningUseState = 'false';
  TypePointageModel? defaultTypePointageRef;
  List<Map<String, dynamic>> constrainteSoundPath = [
    {'identifiant': 1, 'text': 'MinNightDelay.WAV'},
    {'identifiant': 2, 'text': 'MinNbDayNumber.WAV'},
    {'identifiant': 3, 'text': 'MinNbDayNumber.WAV'},
    {'identifiant': 4, 'text': 'MaxDelayPerDay.WAV'},
    {'identifiant': 5, 'text': 'MaxDelayPerWeek.WAV'},
    {'identifiant': 6, 'text': 'MaxNbShift.WAV'},
    {'identifiant': 7, 'text': 'ValidWorkingHours.WAV'},
    {'identifiant': 8, 'text': 'MinPauseDelay.WAV'},
    {'identifiant': 9, 'text': 'MaxDelayPerMonth.WAV '},
    {'identifiant': 10, 'text': 'MinFreeDay.WAV'},
    {'identifiant': 11, 'text': 'ValidWorkingHours.WAV'},
    {'identifiant': 12, 'text': 'STRMSG07.WAV'},
    {'identifiant': 13, 'text': 'STRMSG07.WAV'},
    {'identifiant': 14, 'text': 'MaxDelayWorkPerDay.WAV'},
  ];
  dynamic coordination;
  String audioLang = '';
}
