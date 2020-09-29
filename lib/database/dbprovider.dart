import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../models/user.dart';
import 'userdb.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'UI.db'),
      onCreate: (db, version) async {
        await db.execute('''
       CREATE TABLE users (
         id INTERGER PRIMARY KEY, email TEXT, username TEXT, password TEXT
       )
      ''');
      },
      version: 1,
    );
  }

newUser(User newUser) async => newUserFunc(newUser: newUser, database: database);
   
 
  Future<dynamic> getUser(User userId) async => getUserFunc(userId: userId, database: database); 
}
