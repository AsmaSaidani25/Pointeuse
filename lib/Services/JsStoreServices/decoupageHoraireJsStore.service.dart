import 'package:path/path.dart';
import 'package:pointeuse/Model/decoupage.horaire.model.dart';
import 'package:sqflite/sqflite.dart';

class DecoupageHoraireJsStoreService {
  Database? _database;
  static const String tableName = 'decoupage';

  DecoupageHoraireJsStoreService(Database database) {
    this._database = database;
  }

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await openDatabase(
      join(await getDatabasesPath(), '_database.db'),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE IF NOT EXISTS $tableName ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'idDecoupageHoraire INTEGER,'
          'valeurDimanche TEXT,'
          'valeurDimancheIsNight INTEGER,'
          'valeurDimancheIsNew INTEGER,'
          'idFront TEXT,'
          'valeurLundi TEXT,'
          'valeurLundiIsNight INTEGER,'
          'valeurLundiIsNew INTEGER,'
          'valeurMardi TEXT,'
          'valeurMardiIsNight INTEGER,'
          'valeurMardiIsNew INTEGER,'
          'valeurMercredi TEXT,'
          'valeurMercrediIsNight INTEGER,'
          'valeurMercrediIsNew INTEGER,'
          'valeurJeudi TEXT,'
          'valeurJeudiIsNight INTEGER,'
          'valeurJeudiIsNew INTEGER,'
          'valeurVendredi TEXT,'
          'valeurVendrediIsNight INTEGER,'
          'valeurVendrediIsNew INTEGER,'
          'valeurSamedi TEXT,'
          'valeurSamediIsNight INTEGER,'
          'valeurSamediIsNew INTEGER,'
          'hasCorrectValue INTEGER,'
          'isVisited INTEGER,'
          'canDelete INTEGER,'
          'debut TEXT,'
          'fin TEXT,'
          'phaseLibelle TEXT'
          ')',
        );
      },
      version: 1,
    );

    return _database;
  }

  Future<void> createTable() async {
    final db = await database;
    if (db != null) {
      await db.execute(
        'CREATE TABLE IF NOT EXISTS $tableName ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'idDecoupageHoraire INTEGER,'
        'valeurDimanche TEXT,'
        'valeurDimancheIsNight INTEGER,'
        'valeurDimancheIsNew INTEGER,'
        'idFront TEXT,'
        'valeurLundi TEXT,'
        'valeurLundiIsNight INTEGER,'
        'valeurLundiIsNew INTEGER,'
        'valeurMardi TEXT,'
        'valeurMardiIsNight INTEGER,'
        'valeurMardiIsNew INTEGER,'
        'valeurMercredi TEXT,'
        'valeurMercrediIsNight INTEGER,'
        'valeurMercrediIsNew INTEGER,'
        'valeurJeudi TEXT,'
        'valeurJeudiIsNight INTEGER,'
        'valeurJeudiIsNew INTEGER,'
        'valeurVendredi TEXT,'
        'valeurVendrediIsNight INTEGER,'
        'valeurVendrediIsNew INTEGER,'
        'valeurSamedi TEXT,'
        'valeurSamediIsNight INTEGER,'
        'valeurSamediIsNew INTEGER,'
        'hasCorrectValue INTEGER,'
        'isVisited INTEGER,'
        'canDelete INTEGER,'
        'debut TEXT,'
        'fin TEXT,'
        'phaseLibelle TEXT'
        ')',
      );
    } else {
      throw Exception('Database is null');
    }
  }

  Future<void> terminateInstance() async {
    _database?.close();
  }

  Future<int> addDecoupage(DecoupageHoraireModel entity) async {
    var db = await _database;
    if (db != null) {
      return await db.transaction((txn) async {
        int result = await txn.insert(tableName, entity.toMap());
        return result;
      });
    } else {
      throw Exception('Database is null');
    }
  }

  Future<List<DecoupageHoraireModel>> getListDecoupage() async {
    final db = await _database;
    if (db != null) {
      final results = await db.query(tableName);
      return results.map((map) => DecoupageHoraireModel.fromMap(map)).toList();
    } else {
      throw Exception('Database is null');
    }
  }

  Future<bool> clearData() async {
    final db = await _database;
    if (db == null) {
      throw Exception('Database is null');
      return false;
    } else {
      await db.delete(tableName);
      return true;
    }
  }

  Future<bool> tableExists(String tableName) async {
    final List<Map<String, dynamic>> tables = await _database!.query(
      'sqlite_master',
      columns: ['name'],
      where: 'type = ? AND name = ?',
      whereArgs: ['table', tableName],
    );
    return tables.isNotEmpty;
  }
}
