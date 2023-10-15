import 'package:pointeuse/Model/anomalie.model.dart';
import 'package:pointeuse/Model/employee.model.dart';
import 'package:pointeuse/Services/JsStoreServices/generic-crud.service.dart';
import 'package:sqflite/sqflite.dart';

class AnomalieJsStoreService extends GenericCRUDSqliteService {
  final Database _db;

  AnomalieJsStoreService(this._db);

  Future<List<AnomalieModel>> getAnomalieByDate(DateTime date) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'anomalie',
      where: 'dateAnomalie = ?',
      whereArgs: [date.toIso8601String()],
    );

    return List.generate(maps.length, (i) {
      return AnomalieModel.fromMap(maps[i]);
    });
  }

  static Future addAnomalie(AnomalieModel entity, Database _db) async {
    await _db.insert('anomalie', entity.toMap());
  }

  Future<int> getCountAnomalie(DateTime date) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'anomalie',
      where: 'dateAnomalie = ?',
      whereArgs: [date.toIso8601String()],
    );

    return maps.length;
  }

  Future<void> updateAnomalie(AnomalieModel anomalie) async {
    await _db.update(
      'anomalie',
      anomalie.toMap(),
      where: 'idFront = ?',
      whereArgs: [anomalie.idFront],
    );
  }

  Future<void> deleteAnomalie(AnomalieModel anomalie) async {
    await _db.delete(
      'anomalie',
      where: 'idFront = ?',
      whereArgs: [anomalie.idFront],
    );
  }

  Future<void> deleteAnomalieForEmployee(EmployeeModel employee) async {
    await _db.delete(
      'anomalie',
      where: 'idEmployee = ?',
      whereArgs: [employee.idEmployee],
    );
  }
}
