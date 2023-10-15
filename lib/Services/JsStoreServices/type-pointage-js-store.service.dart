import 'package:sqflite/sqflite.dart';

class TypePointageJsStoreService {
  late final Database _db;

  TypePointageJsStoreService() {}

  Future<void> addAll(List<Map<String, dynamic>> typePointages) async {
    await _db.transaction((txn) async {
      final batch = txn.batch();
      for (final typePointage in typePointages) {
        batch.insert('TYPE_POINTAGE', typePointage);
      }
      await batch.commit();
    });
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    return _db.query('TYPE_POINTAGE');
  }

  Future<List<Map<String, dynamic>>> getOneByLibelle(String libelle) async {
    return _db.query(
      'TYPE_POINTAGE',
      where: 'libelle = ?',
      whereArgs: [libelle],
    );
  }

  Future<List<Map<String, dynamic>>> getOneById(int id) async {
    return await _db.query(
      'TYPE_POINTAGE',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> clearData() async {
    return _db.delete('TYPE_POINTAGE');
  }
}
