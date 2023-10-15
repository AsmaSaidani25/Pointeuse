import 'package:pointeuse/Model/enumeration/NameOfTable.enum.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDatabaseHelper {
  SqfliteDatabaseHelper.internal();
  static final SqfliteDatabaseHelper instance =
      new SqfliteDatabaseHelper.internal();
  factory SqfliteDatabaseHelper() => instance;

  static Database? data_base_pointeuse;
  final String databaseName = 'data_base_pointeuse';
  final int databaseVersion = 1;

  Future<Database?> get db async {
    if (data_base_pointeuse != null) {
      return data_base_pointeuse;
    }
    data_base_pointeuse = await initDb(); // Call the initDb method here
    return data_base_pointeuse;
  }

  Future<Database> initDb() async {
    // Get the database path
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databaseName);

    // Open the database
    Database database = await openDatabase(
      path,
      version: databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE ${NameOfTable.ANOMALIE} (
          idFront INTEGER PRIMARY KEY,
          dateAnomalie TEXT,
          idPointage INTEGER,
          idEmployee INTEGER,
          idRestaurant INTEGER,
          badgeEmployee TEXT,
          nomEmploye TEXT,
          prenomEmploye TEXT,
          valeurContrainte TEXT,
          libelleAnomalie TEXT,
          valide INTEGER,
          isPreAlarme INTEGER
        )
      ''');
        await db.execute('''
      CREATE TABLE ${NameOfTable.MESSAGE} (
       IdFront INTEGER PRIMARY KEY,
       IdMessageReceiver INTEGER,
       IsViewed INTEGER
      )
    ''');
        await db.execute('''
      CREATE TABLE ${NameOfTable.POINTAGE} (
        IdFront INTEGER PRIMARY KEY,
       IdEmployee INTEGER,
       DateJournee TEXT,
     IdRestaurant INTEGER
      )
    ''');
        await db.execute('''
      CREATE TABLE ${NameOfTable.DECOUPAGE} (
        IdFront INTEGER PRIMARY KEY,
      )
    ''');
        await db.execute('''
      CREATE TABLE ${NameOfTable.TYPE_POINTAGE} (
        IdFront INTEGER PRIMARY KEY,
        Id INTEGER,
        libelle TEXT,
        statut bool, 
      )
    ''');
        await db.execute('''
      CREATE TABLE ${NameOfTable.CORRECTION_POINTAGE} (
       IdFront INTEGER PRIMARY KEY,
       dayOfActivit TEXT,
      )
    ''');
        //   await db.execute('''
        //   CREATE TABLE ${NameOfTable.SHIFT} (
        //    IdFront INTEGER PRIMARY KEY,
        //    IdMessageReceiver INTEGER,
        //    IsViewed INTEGER
        //   )
        // ''');
        await db.execute('''
      CREATE TABLE ${NameOfTable.ABSENCE} (
       IdFront INTEGER PRIMARY KEY,
      )
    ''');
        await db.execute('''
      CREATE TABLE ${NameOfTable.EMPLOYEE} (
       IdFront INTEGER PRIMARY KEY,
       IdEmployee INTEGER,
       IdRestaurant INTEGER
      )
    ''');
        await db.execute('''
      CREATE TABLE ${NameOfTable.RESTAURANT} (
       IdFront INTEGER PRIMARY KEY,
   
      )
    ''');
        await db.execute('''
      CREATE TABLE ${NameOfTable.PARAMETRE} (
       IdFront INTEGER PRIMARY KEY,
       param TEXT
      )
    ''');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        // Handle database schema upgrades here if necessary
      },
    );
    return database;
  }
}
