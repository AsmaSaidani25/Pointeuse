import 'package:pointeuse/Model/decoupage.horaire.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DecoupageHoraireJsStoreService {
  static Database? _database;
  static const String tableName = 'decoupage';

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

  Future<int> addDecoupage(DecoupageHoraireModel entity) async {
    final _database = await database;
    return await _database!.insert(tableName, entity.toMap());
  }

  Future<List<DecoupageHoraireModel>?> getListDecoupage() async {
    final _database = await database;
    final results = await _database!.query(tableName);
    return results.map((map) => DecoupageHoraireModel.fromMap(map)).toList();
  }

  Future<void> clearData() async {
    final _database = await database;
    await _database!.delete(tableName);
  }
}
