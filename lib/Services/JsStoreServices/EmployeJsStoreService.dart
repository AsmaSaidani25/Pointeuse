import 'package:pointeuse/Model/employee.model.dart';
import 'package:pointeuse/Model/pagination.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EmployeJsStoreService {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    // Open the database (create if it doesn't exist)
    _database = await openDatabase(
      join(await getDatabasesPath(), '_database.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE employee(
            id INTEGER PRIMARY KEY,
            idFront TEXT,
            matricule TEXT,
            email TEXT,
            restaurantId INTEGER,
            idRestaurant INTEGER,
            sexe TEXT,
            nom TEXT,
            prenom TEXT,
            adresse TEXT,
            nomJeuneFille TEXT,
            situationFamiliale TEXT,
            dateNaissance TEXT,
            codePostal TEXT,
            ville TEXT,
            numTelephone TEXT,
            numPortable TEXT,
            dateEntree TEXT,
            dateSortie TEXT,
            dateRemise TEXT,
            dateRestitution TEXT,
            motifSortie TEXT,
            statut INTEGER,
            majeur TEXT,
            etat TEXT,
            carte TEXT,
            hebdoCourant TEXT,
            complAdresse TEXT,
            hasLaws INTEGER,
            badge TEXT,
            finValiditeSejour TEXT,
            finValiditeAutorisationTravail TEXT,
            displayedName TEXT,
            totalRowTime TEXT,
            fullName TEXT,
            disablePlanningManagerOrLeaderOrFixe INTEGER,
            isSelected INTEGER
          )
        ''');
      },
    );
  }

  Future<void> insertEmployees(List<EmployeeModel> employees) async {
    await _database!.transaction((txn) async {
      final batch = txn.batch();
      for (final employee in employees) {
        batch.insert('employee', employee.toMap());
      }
      await batch.commit();
    });
  }

  Future<List<EmployeeModel>> getEmployees() async {
    final maps = await _database!.query('employee');
    return List.generate(maps.length, (index) {
      return EmployeeModel.fromMap(maps[index]);
    });
  }

  Future<void> updateEmployee(EmployeeModel employee) async {
    await _database!.update(
      'employee',
      employee.toMap(),
      where: 'id = ?',
      whereArgs: [employee.idEmployee],
    );
  }

  Future<void> deleteEmployee(int employeeId) async {
    await _database!.delete(
      'employee',
      where: 'id = ?',
      whereArgs: [employeeId],
    );
  }

  Future<int> addALLEmployees(List<EmployeeModel> entities) async {
    final batch = _database!.batch();
    for (var entity in entities) {
      batch.insert('employee', entity.toMap());
    }
    final results = await batch.commit();
    return results.length;
  }

  Future<int> clear() async {
    return await _database!.delete('employee');
  }

  Future<List<EmployeeModel>> getEmployesList() async {
    final List<Map<String, dynamic>> maps = await _database!.query('employee');
    return List.generate(
        maps.length, (index) => EmployeeModel.fromMap(maps[index]));
  }

  /* Future<List<EmployeeModel>> getEmployeesByPage(PaginationArgs paginationArgs) async {
    final List<Map<String, dynamic>> maps = await _database!.query(
      'employee',
      limit: paginationArgs.pageSize,
      offset: paginationArgs.pageSize * paginationArgs.pageNumber,
    );
    return List.generate(maps.length, (index) => EmployeeModel.fromMap(maps[index]));
  }*/

  static Future<void> deleteEmployeePrete(
      String tableName, int idRestaurant) async {
    try {
      await _database!.delete(tableName,
          where: 'idRestaurant = ?', whereArgs: [idRestaurant]);
    } catch (error) {
      print('Error deleting employee prete: $error');
    }
  }

  static Future<EmployeeModel> getEmployesByIdEmployee(int? idEmploye) async {
    final List<Map<String, dynamic>> maps = await _database!.query(
      'employee',
      where: 'idEmployee = ?',
      whereArgs: [idEmploye],
    );
    if (maps.isNotEmpty) {
      return EmployeeModel.fromMap(maps.first);
    }
    throw Exception('Employee not found');
  }

  Future<int> addEmployee(EmployeeModel entity) async {
    try {
      final id = await _database!.insert('employee', entity.toMap());
      return id;
    } catch (error) {
      print('Error adding employee: $error');
      return -1; // Return a sentinel value indicating failure
    }
  }

  Future<List<EmployeeModel>> getById(int entityIdEmploye) async {
    final List<Map<String, dynamic>> maps = await _database!.query(
      'employee',
      where: 'id = ?',
      whereArgs: [entityIdEmploye],
    );
    return List.generate(
        maps.length, (index) => EmployeeModel.fromMap(maps[index]));
  }
}
