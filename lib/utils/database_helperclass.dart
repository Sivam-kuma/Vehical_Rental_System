import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:vehical_rental_system/modelclass/classfile.dart';
import 'package:async/async.dart';

class DatabaseHelper {
  late DatabaseHelper _databaseHelper;
  Database? _database;

  String noteTable = 'note_table';
  String? colId= 'id';
  String colName = 'name';
  String colStatus = 'status';
  String colamount = 'amountnew';
  String colDate = 'date';

  // Use a private constructor for the singleton pattern
  DatabaseHelper._createInstance();

  // Create a singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._createInstance();

  // Provide a way to access the instance
  factory DatabaseHelper() {
    return _instance;
  }

  // Ensure that the database is initialized before using it
  Future<Database?> get database async {
    if (_database == null) {
      await initializeDatabase();
    }
    return _database;
  }

  // Initialize the database
  Future<void> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/nodes.db';

    try {
      _database = await openDatabase(path, version: 1, onCreate: _createDb);
    } catch (e) {
      print('Error initializing database: $e');
      rethrow;
    }
  }

  // Create the database table
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT , $colStatus TEXT, $colamount INTEGER, $colDate INTEGER)');
  }

  // Retrieve a list of notes from the database
  Future<List<Map<String, dynamic>>?> getNotMapList() async {
    Database? db = await this.database;
    var result = await db?.query(noteTable, orderBy: '$colDate ASC');
    return result;
  }

  // Insert a note into the database
  Future<int?> insertNote(Node note) async {
    Database? db = await this.database;
    var result = await db?.insert(noteTable, note.toMap());
    return result;
  }
  // Future<int?> insertNote(Node note) async {
  //   Database? db = await this.database;
  //   var result = await db?.insert(noteTable, note.toMap());
  //   return result;
  // }
  // Update a note in the database
  Future<int?> updateNote(Node note) async {
    var db = await this.database;
    var result = await db?.update(
        noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }
}

