import 'package:pointeuse/Model/enumeration/NameOfTable.enum.dart';
import 'package:pointeuse/Model/parametre.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dbJsStore.service.dart';

class ParametreJsStoreService extends DbJsStoreService {
  late Database _database;

  final tableName = NameOfTable.PARAMETRE;

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

  Future<void> addParameter(ParametreModel entity) async {
    await _database.insert('parameter', entity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ParametreModel>> getListParameter() async {
    final maps = await _database.query('parameter');
    return List.generate(maps.length, (index) {
      return ParametreModel.fromMap(maps[index]);
    });
  }

  Future<void> updateListParametre(List<ParametreModel> parammetreList) async {
    final batch = _database.batch();
    for (final parametre in parammetreList) {
      if (parametre.valeur is DateTime) {
        //parametre.valeur = dateService.setStringFromDate(parametre.valeur);
      }
      batch.update('parameter', parametre.toMap(),
          where: 'idFront = ?', whereArgs: [parametre.idFront]);
    }
    await batch.commit();
  }

  static Future<List<ParametreModel>> getParamatreByParam(String param) async {
    ParametreJsStoreService instance = ParametreJsStoreService();
    final List<Map<String, dynamic>> results = await instance._database!.query(
      NameOfTable.PARAMETRE,
      where: 'param = ?',
      whereArgs: [param],
    );

    return results.map((result) => ParametreModel.fromMap(result)).toList();
  }
}
