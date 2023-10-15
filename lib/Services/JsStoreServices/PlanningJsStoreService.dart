import 'package:pointeuse/Model/enumeration/NameOfTable.enum.dart';
import 'package:pointeuse/Model/pointage.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dbJsStore.service.dart';

class PlaningJsStoreService extends DbJsStoreService {
  late Database _database;
  final tableName = NameOfTable.POINTAGE;

  Future<Database?> get database async {
    if (_database != null) return _database;

    // Open the database (create if it doesn't exist)
    _database = await openDatabase(
      join(await getDatabasesPath(), '_database.db'),
      onCreate: (db, version) {
        // Create tables if they don't exist
        db.execute(
          'CREATE TABLE IF NOT EXISTS $tableName ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          // Define your table columns here
          ')',
        );
      },
      version: 1,
    );

    return _database;
  }

  static Future<List<PointageModel>?> deletePlanningPreteByEmployees(
      String tableName, List<int> idEmployees) async {
    final instance = PlaningJsStoreService();

    await instance._database.delete(
      tableName,
      where: 'idEmployee IN (${idEmployees.join(",")})',
    );
    return null;
  }

  static Future<void> addPointage(PointageModel entity) async {
    PlaningJsStoreService instance = PlaningJsStoreService();
    await instance._database.insert('pointage', entity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<PointageModel>> getListPointage() async {
    PlaningJsStoreService instance = PlaningJsStoreService();
    final maps = await instance._database.query('pointage');
    return List.generate(maps.length, (index) {
      return PointageModel.fromMap(maps[index]);
    });
  }

  Future<List<PointageModel>> getPointagesByDateJourneeAndIdEmployee(
      String dateJournee, List<int> idEmployees) async {
    final maps = await _database.query('pointage',
        where: 'dateJournee = ? AND idEmployee IN (${idEmployees.join(", ")})',
        whereArgs: [dateJournee]);
    return List.generate(maps.length, (index) {
      return PointageModel.fromMap(maps[index]);
    });
  }

  Future<List<PointageModel>> getPointagesByDateJourneeAndIdRestaurant(
      String dateJournee, int idRestaurant) async {
    final maps = await _database.query('pointage',
        where: 'dateJournee = ? AND idRestaurant = ?',
        whereArgs: [dateJournee, idRestaurant]);
    return List.generate(maps.length, (index) {
      return PointageModel.fromMap(maps[index]);
    });
  }

  Future<void> deletePointage(String idFront) async {
    await _database
        .delete('pointage', where: 'idFront = ?', whereArgs: [idFront]);
  }

  static Future<List<PointageModel>> getAllPointage() async {
    PlaningJsStoreService instance = PlaningJsStoreService();

    final List<Map<String, dynamic>> results = await instance._database!.query(
      NameOfTable.POINTAGE,
    );

    return results.map((result) => PointageModel.fromMap(result)).toList();
  }

  static Future<void> deleteAllPointageBefore2Months() async {
    PlaningJsStoreService instance = PlaningJsStoreService();

    final date = DateTime.now();
    final dateMinusTwoMonths = DateTime(date.year, date.month - 2, date.day);
    final pointageList = await getAllPointage();

    if (pointageList.isNotEmpty) {
      pointageList.forEach((pointage) {
        final d = DateTime.parse(pointage.dateJournee);
        if (d.isBefore(dateMinusTwoMonths)) {
          instance._database!.delete(
            NameOfTable.POINTAGE,
            where: 'idFront = ?',
            whereArgs: [pointage.idFront],
          );
        }
      });
    }
  }

  Future<void> updatePointage(PointageModel pointageToUpdate) async {
    await _database.update('pointage', pointageToUpdate.toMap(),
        where: 'idFront = ?', whereArgs: [pointageToUpdate.idFront]);
  }
}
