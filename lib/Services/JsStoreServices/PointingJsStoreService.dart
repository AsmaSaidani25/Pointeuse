import 'package:sqflite/sqflite.dart';

class PointingJsStoreService {
  late final Database _database;

  PointingJsStoreService(Database database) {
    _database = database;
  }

  Future<List<Map<String, dynamic>>> getPointingByEmployee(
      int idEmployee) async {
    return _database.query(
      'POINTAGE', // Replace with your table name
      where: 'idEmployee = ?',
      whereArgs: [idEmployee],
    );
  }

  Future<List<Map<String, dynamic>>> getPointingByDate(String date) async {
    return _database.query(
      'POINTAGE', // Replace with your table name
      where: 'dateJournee = ?',
      whereArgs: [date],
    );
  }
}
