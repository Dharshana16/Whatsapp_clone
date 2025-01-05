import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_project/models/User.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "whatsapp.db";
  static const _databaseVersion = 1;

  static final tableUser = 'User';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableUser (
            id TEXT PRIMARY KEY,
            userData TEXT NULL
          )
          ''');

/*    await db.execute('''
          CREATE TABLE $tableMyTask (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            myTaskData TEXT NULL,
             groupName TEXT NULL
          )
          ''');*/
  }

  //write _onUpgrade method
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    /* if (oldVersion < newVersion) {
      await db.execute('''
          CREATE TABLE $tableMyTask (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            myTaskData TEXT NULL,
            groupName TEXT NULL
          )
          ''');
    }*/
  }

  Future<int?> insertUser(User user) async {
    Database? db = await instance.database;
    return await db?.insert(
        tableUser, {'id': user.id, 'userData': jsonEncode(user.toJson())},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //get a project from tableProject by id
  Future<Map<String, dynamic>?> getUser(dynamic id) async {
    Database? db = await instance.database;
    List<Map<String, Object?>>? rows =
    await db?.query(tableUser, where: 'id = ?', whereArgs: [id]);
    return rows?.first;
  }

  //insert or update a ProjectModel into tableProject
  Future<int?> insertOrUpdateUser(User user) async {
    Database? db = await instance.database;
    return await db?.insert(tableUser, user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //get all users from tableUser
  Future<List<User>> getAllUsers() async {
    Database? db = await instance.database;
    List<Map<String, Object?>> rows = await db!.query(tableUser);
    return List.generate(rows.length, (index) {
      return User.fromJson(jsonDecode(rows[index]['userData'] as String));
    });
  }
}
