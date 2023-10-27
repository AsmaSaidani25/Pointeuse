import 'package:pointeuse/Model/enumeration/NameOfTable.enum.dart';
import 'package:pointeuse/Model/shift.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ShiftJsStoreService {
  late final Database _database;

  // final BehaviorSubject<bool> _synchronisedSubject = BehaviorSubject<bool>();

  static final String tableName = NameOfTable.SHIFT;

  static Future<int> addShift(Map<String, dynamic> entity) async {
    ShiftJsStoreService instance = ShiftJsStoreService();

    return instance._database.insert(tableName, entity);
  }

  static Future<List<Map<String, dynamic>>?> getShiftList() async {
    ShiftJsStoreService instance = ShiftJsStoreService();

    return instance._database.query(tableName);
  }

  static Future<List<ShiftModel>> getByDateJournee(String dateJournee) async {
    ShiftJsStoreService instance = ShiftJsStoreService();

    final List<Map<String, dynamic>> results = await instance._database.query(
      NameOfTable.SHIFT,
      where: 'dateJournee = ?',
      whereArgs: [dateJournee],
    );
    List<ShiftModel> resultList =
        results.map((result) => ShiftModel.fromMap(result)).toList();

    return resultList;
  }

  static Future<int> clearData() async {
    ShiftJsStoreService instance = ShiftJsStoreService();
    return instance._database.delete(tableName);
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
