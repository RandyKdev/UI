import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
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
Directory dp = await getApplicationDocumentsDirectory();
    return await openDatabase(
      join(dp.path, 'UI.db'),
      onCreate: (db, version) async {
        await db.execute('''
       CREATE TABLE USERS (
         ID INTEGER PRIMARY KEY, EMAIL TEXT, USERNAME TEXT, PASSWORD TEXT
       )
      ''');
      await db.execute('''
       CREATE TABLE LOGEDIN (
          ID INTEGER PRIMARY KEY, USERNAME TEXT 
       ) 
      '''); 
      },
      version: 1,
    );
  }

Future<int> newUser(User newUser) async => newUserFunc(newUser: newUser, database: database);
   
 
  Future<User> getUser(int userId) async => getUserFunc(userId: userId, database: database); 
 

Future<int> signIn(User user) async => signInFunc(user: user, database: database);

}