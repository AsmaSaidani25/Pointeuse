import 'package:pointeuse/Model/restaurant.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class InfoRestaurantJsStoreService {
  static Database? _database;
  static const String tableName = 'restaurant';

  Future<Database?> get database async {
    if (_database != null) return _database;

    // Open the database (create if it doesn't exist)
    _database = await openDatabase(
      join(await getDatabasesPath(), 'your_database.db'),
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

  static Future<void> addRestaurant(RestaurantModel restaurant) async {
    final mapRepresentation =
        restaurant.toJson(); // Convert RestaurantModel to Map
    await _database!.insert('restaurant', mapRepresentation);
  }

  Future<List<Map<String, dynamic>>> getRestaurantList() async {
    return _database!.query('restaurant');
  }

  Future<void> clearData() async {
    await _database!.delete('restaurant');
  }
}
