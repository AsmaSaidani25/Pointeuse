import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class IdbService {
  static Database? _database;
  static const String dbName = 'your_database.db';

  Future<Database?> get database async {
    if (_database != null) return _database;

    // Open the database (create if it doesn't exist)
    _database = await openDatabase(
      join(await getDatabasesPath(), dbName),
      version: 1,
      onCreate: (db, version) {
        // Create tables if they don't exist
        db.execute(
          'CREATE TABLE IF NOT EXISTS your_table ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          // Define your table columns here
          ')',
        );
      },
    );

    return _database;
  }

  Future<void> addItems(String target, dynamic value) async {
    final _database = await database;
    await _database!.insert(target, value);
  }

  Future<void> updateItem(String target, dynamic value) async {
    final _database = await database;
    await _database!.update(
      target,
      value,
      where: 'id = ?',
      whereArgs: [value['id']], // assuming 'id' is the primary key column
    );
  }

  Future<void> deleteItems(String target, dynamic key) async {
    final _database = await database;
    await _database!.delete(
      target,
      where: 'id = ?',
      whereArgs: [key],
    );
  }

  Future<List<dynamic>> getAllData(String target) async {
    final _database = await database;
    return await _database!.query(target);
  }
}
