import 'package:pointeuse/Model/enumeration/NameOfTable.enum.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ShiftJsStoreService {
  late final Database _database;
  // final BehaviorSubject<bool> _synchronisedSubject = BehaviorSubject<bool>();

  Future<Database> _initializeDatabase() async {
    // Replace with your database initialization logic here
    final dbPath = await getDatabasesPath();
    final databasePath = join(dbPath, '_database.db');

    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        // Define your table creation logic here
        db.execute(
          'CREATE TABLE IF NOT EXISTS $tableName ('
          // Define your table columns here
          ')',
        );
      },
      version: 1,
    );

    return database;
  }

  final String tableName =
      NameOfTable.SHIFT; // Replace with your actual table name

  ShiftJsStoreService(Database database) {
    _database = database;
  }

  Future<int> addShift(Map<String, dynamic> entity) async {
    return _database.insert(tableName, entity);
  }

  Future<List<Map<String, dynamic>>> getShiftList() async {
    return _database.query(tableName);
  }

  Future<List<Map<String, dynamic>>> getByDateJournee(
      String dateJournee) async {
    return _database.query(
      tableName,
      where: 'dateJournee = ?',
      whereArgs: [dateJournee],
    );
  }

  Future<int> clearData() async {
    return _database.delete(tableName);
  }

  /* void setSynchronisedListShift(bool synchronised) {
    _synchronisedSubject.add(synchronised);
  }

  Stream<bool> getSynchronisedListShift() {
    return _synchronisedSubject.stream;
  }

  void dispose() {
    _synchronisedSubject.close();
  }*/
}
