import 'package:pointeuse/Model/type.pointage.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbJsStoreService<T> {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    // Open the database (create if it doesn't exist)
    _database = await openDatabase(
      join(await getDatabasesPath(), '_database.db'),
      onCreate: (db, version) {
        // Create tables if they don't exist
        db.execute(
          'CREATE TABLE IF NOT EXISTS your_table ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          // Define your table columns here
          ')',
        );
      },
      version: 1,
    );

    return _database;
  }

  Future<List<Map<String, dynamic>>> getAll(String tableName) async {
    return _database!.query(tableName);
  }

  Future<void> add(String tableName, Map<String, dynamic> entity) async {
    await _database!.insert(tableName, entity);
  }

  /* Future<void> addAll(String tableName, List<Map<String, dynamic>> entities) async {
    await _database!.batch((batch) {
      for (var entity in entities) {
        batch.insert(tableName, entity);
      }
    });
  }*/

  Future<void> delete(String tableName, String entityIdFront) async {
    await _database!
        .delete(tableName, where: 'idFront = ?', whereArgs: [entityIdFront]);
  }

  Future<void> update(String tableName, String idFront,
      Map<String, dynamic> updateValue) async {
    await _database!.update(tableName, updateValue,
        where: 'idFront = ?', whereArgs: [idFront]);
  }

  Future<List<Map<String, dynamic>>> getByIdFront(
      String tableName, String entityIdFront) async {
    return _database!
        .query(tableName, where: 'idFront = ?', whereArgs: [entityIdFront]);
  }

  Future<List<Map<String, dynamic>>> getByIdEmploye(
      String tableName, int entityIdEmploye) async {
    return _database!.query(tableName,
        where: 'idEmployee = ?', whereArgs: [entityIdEmploye]);
  }

  Future<void> clear(String tableName) async {
    await _database!.delete(tableName);
  }

  Future<int?> getCount(String tableName, String date) async {
    return Sqflite.firstIntValue(await _database!.rawQuery(
        'SELECT COUNT(*) FROM $tableName WHERE dateAnomalie = ?', [date]));
  }

  Future<void> deleteEmployeePrete(String tableName, int idRestaurant) async {
    await _database!.delete(tableName,
        where: 'idRestaurant != ?', whereArgs: [idRestaurant]);
  }
}
