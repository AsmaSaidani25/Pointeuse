import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  static const String DB_Name = 'test.db';
  static const String Table_User = 'user';
  static const int Version = 1;
  static const String C_UserID = 'user_id';
  static const String C_UserName = 'user_name';
  static const String C_Email = 'email';
  static const String C_Password = 'password';
  static const String Table_SelectedRestaurant = 'selectedRestaurant';
  static const String C_RestaurantName = 'libelle';
  static const String C_CodePointeuse = 'codePointeuse';

  DatabaseHelper._privateConstructor();

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await instance._initDatabase();
    return _database!;
  }

  static Future<int?> saveSelectedRestaurant(
      String libelle, String codePointeuse) async {
    var dbClient = await _database;
    var res = await dbClient?.insert(Table_SelectedRestaurant, {
      C_RestaurantName: libelle,
      C_CodePointeuse: codePointeuse,
    });
    return res;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE my_table(
            id INTEGER PRIMARY KEY,
            name TEXT,
            age INTEGER
          )
        ''');
      },
    );
  }
}
