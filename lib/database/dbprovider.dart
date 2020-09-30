import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import './nameConstants.dart';


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
       CREATE TABLE $userTable (
         $id INTEGER PRIMARY KEY, $email TEXT, $username TEXT, $password TEXT
       )
      ''');
       await db.execute('''
       CREATE TABLE $personalInformationTable (
         $id INTEGER PRIMARY KEY, $profileTitle TEXT, $firstName TEXT,
     $middleName TEXT,
      $lastName TEXT,
      $gender TEXT,
      $birthPlace TEXT,
      $dateOfBirth TEXT,
      $nationality TEXT,
      $bloodGroup TEXT,
      $motherTongue TEXT,
      $religion TEXT,
      $currentQualification TEXT,
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