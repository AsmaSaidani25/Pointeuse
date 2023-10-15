import 'dart:async';
import 'package:pointeuse/Model/enumeration/NameOfTable.enum.dart';
import 'package:pointeuse/Model/shift.model.dart';
import 'package:sqflite/sqflite.dart';
import 'dbJsStore.service.dart';

class ShiftJsStoreService extends DbJsStoreService<ShiftModel> {
  final StreamController<bool> _synchronisedSubject =
      StreamController<bool>.broadcast();

  final String tableName = NameOfTable.SHIFT;

  ShiftJsStoreService() : super();

/*  void addShift(ShiftModel entity) {
    super.add(tableName, entity);
  }*/

  void addShift(ShiftModel entity) {
    Map<String, dynamic> shiftMap = entity.toMap();
    super.add(tableName, shiftMap);
  }

  /* Future<List<ShiftModel>> getShiftList() async {
    final shifts = await super.getAll(tableName);
    return shifts;
  }*/

  Future<List<ShiftModel>?> getShiftList(String tableName) async {
    final List<Map<String, dynamic>> dataList =
        (await super.getAll(tableName)).cast<Map<String, dynamic>>();

    // Convert List<Map<String, dynamic>> to List<ShiftModel>
    final List<ShiftModel> shiftModels =
        dataList.map((data) => ShiftModel.fromMap(data)).toList();

    return shiftModels;
  }

  Future<List<ShiftModel>> getByDateJournee(String dateJournee) async {
    final Database? db = await database;
    final tableName = NameOfTable
        .POINTAGE; // Replace with the actual table name in your database.

    try {
      final List<Map<String, dynamic>> result = await db!.query(
        tableName,
        where: 'dateJournee = ?',
        whereArgs: [dateJournee],
      );

      return result.map((map) => ShiftModel.fromMap(map)).toList();
    } catch (e) {
      print('Error executing the query: $e');
      return [];
    }
  }

  Future<void> clearData() async {
    await super.clear(tableName);
  }

  void setSynchronisedListShift(bool synchronised) {
    _synchronisedSubject.add(synchronised);
  }

  Stream<bool> getSynchronisedListShift() {
    return _synchronisedSubject.stream;
  }

  void dispose() {
    _synchronisedSubject.close();
  }
}
