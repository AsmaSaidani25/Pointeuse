import 'package:pointeuse/Model/CorrectionPointage.dart';
import 'package:pointeuse/Model/enumeration/NameOfTable.enum.dart';
import 'package:pointeuse/Services/JsStoreServices/dbJsStore.service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'generic-crud.service.dart';

class CorrectionPointageService extends GenericCRUDSqliteService {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    // Open the database (create if it doesn't exist)
    _database = await openDatabase(
      join(await getDatabasesPath(), '_database.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE employee(
            idCorrectionPointagePointeuse KEY,
            pointageIdFront TEXT,
            idFront TEXT,
            idEmployee INTEGER,
            idManager INTEGER,
            dayOfActivity TEXT,
            entityAction TEXT,
            pointageTime TEXT,
            newValue TEXT,
            newValueIsNight BOOL,
            nomJeuneFille TEXT,
            oldValue TEXT,
            oldValueIsNight BOOL,
            dateModification TEXT,
            nomEmployee TEXT,
            prenomEmployee TEXT,
            newTypePointage TEXT,
            idRestaurant INTEGER,
       
          )
        ''');
      },
    );
  }

  CorrectionPointageService();
  // Récupération de la liste des corrections à partir de la base de données SQLite
  Future<List<CorrectionPointageModel>> getCorrectionList() async {
    final List<Map<String, dynamic>> correctionMaps = await _database!.query(
      NameOfTable.CORRECTION_POINTAGE,
    );

    return correctionMaps
        .map((map) => CorrectionPointageModel.fromMap(map))
        .toList();
  }

  Future<List<CorrectionPointageModel>> getDailyCorrections(
      String dateJournee) async {
    final List<Map<String, dynamic>> correctionMaps = await _database!.query(
      NameOfTable.CORRECTION_POINTAGE,
      where: 'dayOfActivity = ?',
      whereArgs: [dateJournee],
    );

    return correctionMaps
        .map((map) => CorrectionPointageModel.fromMap(map))
        .toList();
  }

  static Future<int> addCorrection(
    CorrectionPointageModel correctionPointage,
  ) {
    return _database!
        .insert(
      NameOfTable.CORRECTION_POINTAGE,
      correctionPointage.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    )
        .then((value) {
      return value;
    });
  }
}
